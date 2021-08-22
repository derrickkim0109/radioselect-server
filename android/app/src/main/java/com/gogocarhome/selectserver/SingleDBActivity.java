package com.gogocarhome.selectserver;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class SingleDBActivity extends AppCompatActivity {

    Button btn_show;
    String selectedServer = "실서버";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_single_dbactivity);
        btn_show = findViewById(R.id.btn_showAlert);
        btn_show.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showOptionsDialog();
            }

            private void showOptionsDialog() {
                String [] servers = {"실서버", "개발서버", "스테이징서버"};
                AlertDialog.Builder builder = new AlertDialog.Builder(SingleDBActivity.this);
                builder.setTitle("서버 선택하기");
                builder.setSingleChoiceItems(servers, 0, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        selectedServer = servers[which];

                        switch (which){
                            // 실서버
                            case 0:
                                Toast.makeText(SingleDBActivity.this,"Your Just Clicked: " + selectedServer + which, Toast.LENGTH_SHORT).show();
                                break;
                                // 개발서버
                            case 1:
                                Toast.makeText(SingleDBActivity.this,"Your Just Clicked: " + selectedServer + which, Toast.LENGTH_SHORT).show();
                                break;
                                // 스테이징서버
                            case 2:
                                Toast.makeText(SingleDBActivity.this,"Your Just Clicked: " + selectedServer + which, Toast.LENGTH_SHORT).show();
                                break;
                                // 실서버
                            default:
                                Toast.makeText(SingleDBActivity.this,"Your Just Clicked: " + selectedServer + which, Toast.LENGTH_SHORT).show();
                                break;
                        }
                    }
                });

                builder.setPositiveButton("선택하기", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.dismiss();
                    }
                });

                builder.show();
            }
        });
    }



}
