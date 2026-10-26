Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022128;
	b=LIkRuha9mTGmw8WzH3GjR/DTNtwlj2g4s6PfC8sxlrCc03aZzWmlZz3pdA8cYQAicKtk
	 /DJbnpzp2Cc2uKcIKfqQH+gMKOSnSoC8Fs4H0Uet1QLp+3TYuIXX34qPnveXYd0+QBLsR
	 Cvodm76KtlzyHKJWq9pdW6kJCc8HdqTgSR9KO6YNZ+sLpcU0aTBv7RrN0LOtHItnGSNG9
	 FLkc4CGT3DLZ0JppFcw9vCxri9xg2Urhd24Ynk1OMUhNs744izDOGCvpJYzGB1cPdknEg
	 IdU8BrBSOjPU1GGXQ3s+tP4tWQtCOMOC4D2Jv9B7jKP4/1I8ywGD6J2CIId6tjbEQKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022128;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:User-Agent:
	 MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=oUcbRuQvxqLMf3mlpCxogE4P6glYlGSoeDrP4IxGtbU=;
	b=TShjdrez2Z2gwbLa6iJwO3Uqs8GfW35hdCk2H21NMxOE1NtZxdRH4pFF4HdQep9P1bMC
	 1Sn1jn4603eLbSyULAQv8B2iH1jUiZgYoLBryuOzKQTQGYRp2mUZ/542UQQmA9VEzJm5K
	 0RZz6tHMNGxFWmUxudppV4MLfekm/C4NIIdS0gAB723O8gGBxY4wFXu17xMX0dhHLd690
	 Q5YIL1CjFdaEA4kC70d+X4Aar9ecqC1bMpqjT6Fa+OOFnC88iuYhRyxvK1OO7s1hLfYwP
	 vBdRqhWMB4/LgvcT89BX8eRxy8Wo5ZEJmJgJUsnYrWDPCw0S3aR7QjxOU1ZtrrBLFSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NYOtvj84;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6F606A31F
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 13:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C6F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NYOtvj84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793022127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUcbRuQvxqLMf3mlpCxogE4P6glYlGSoeDrP4IxGtbU=;
	b=NYOtvj84UAakuFee6TyW75DgEUhFeoA+kayDRz0B6Z4rYUdAFf6/Q6p+3ANcjBxl93zPF1
	Zy+U6yTvIei06gR7C+5FZHlFAYy7dfsw85fnqwwB/9YVvXjk2RP8qFSQtUZtEkw6NXMmHo
	XCskc3TjBwjFspoetpvddtmlRstJ/T0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-Yjk0YpIsNluTFNvj8SbvZQ-1; Mon, 26 Oct 2026 09:42:06 -0400
X-MC-Unique: Yjk0YpIsNluTFNvj8SbvZQ-1
X-Mimecast-MFC-AGG-ID: Yjk0YpIsNluTFNvj8SbvZQ_1793022124
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536347602faso71880571cf.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 06:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793022124; x=1793626924;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ed+PX3IGkbk+mTJa3PsZsNtkAoyqu1J1xwHAA2Xtd+g=;
        b=uRE9Gwm00defObtgTf1PkCXj7Y+S170ZKqhhvgB3WoTyKNsXJ0yu4Qji2KQhCsPVnb
         IcWEZIvuQCpLcSozoTyEKNFq9wXZwIyiWmTayDzokJS4KWajhIvWEe2X1lBj9wRVIC73
         kkhAOLW3O6eSckIk47OlUbn5KfCImbWLEBwOO+rWEH1JEX2pwLhDgWSkT7OY3r67SGgh
         Blpf/FdRr4w+tWjf/CVKnTssd2bRVEX6sgFR0PwqRb/usQeQa8il0grBaGIrsI0yZKKC
         SZM8mGCMo/rs2fq9pBZvY+2qBHvgrqgvnx35Xd7Goqb1+dygy8+MsQkMLzAQOxEEUPOq
         E5dw==
X-Gm-Message-State: AFq9FYLzA4U6uHCRMeFgZ6KFAfMRaQ6PK+GmzKqjdSWCQ+er1fxO0KLz
	QIYwLKC2SUHjN8XP2/YiG7cUnWxPWYYwPy4XpLiiwf6zrl8dyGY8RK9qu8d+bj2yPFtumMgHa1i
	xw394/WKWcbcXWpEJveKdWWWm8+vahEDoHnExIpEOu/cDu8lTb5BwmkuYOz7Tl//Ndp+KaM0aAY
	4r0iYVO74feuWwnnZs8xh2ITTZOsEBpiBb3u8nG0mHDJxZznq0GJ7kiA==
X-Gm-Gg: AYBFou2yhQNcPWbTyb0S+f3WRf62kyAWJ7kU74KXUrOfHmxGtyL3JRUoH8h7IbIYg6J
	IU/UeRjMiFHSP8zEjZulorGQDGux+o5+SFyeDU5gDp2ZNn4qynngHNfeM3wDVovCuVxQS0lnbpz
	H/xH15oKFuBwYZMErKDX0LXQCHND9qtZW5EAP/Tw1h8vF4HGZbMLLarspAW06l5bA4ua+FhMRxG
	MK36Hv8F71eaqXL4zji2nCvAJsw/VjbHB4LotgxunwkjHi24792ibMYT87o3U91PW7wL2T+oHea
	DV31HoWTyxKK6HRM1ve0S0aa0nC9Yp5aUeZzlUfYL0ZGqedX5ZXqPNfxHwqJ1C4ao+/tnMoKtg/
	anZ9Du6707+MmwPOlsKYr1L2lr/nd44bNjIGmIutYnikhkRioAc1arQs8VGHz2nojwipBD4z1GY
	xySJ4yT2WnHLoMzAIwGmm+oQ==
X-Received: by 2002:a05:622a:5b0d:b0:536:575b:8dd6 with SMTP id d75a77b69052e-5383af13431mr89884511cf.0.1793022124237;
        Mon, 26 Oct 2026 06:42:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5b0d:b0:536:575b:8dd6 with SMTP id d75a77b69052e-5383af13431mr89883771cf.0.1793022123494;
        Mon, 26 Oct 2026 06:42:03 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c53fdcsm72863586d6.27.2026.10.26.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:42:02 -0700 (PDT)
Message-ID: <3e2a63af147ce884e84cd3aee1e456051265d7bc.camel@redhat.com>
Subject: Re: [PATCH v3 2/4] scsi: target: iscsi: Complete an aborted WRITE
 when a new R2T would be sent
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org
Date: Mon, 26 Oct 2026 09:42:02 -0400
In-Reply-To: <sashiko-outbox-185289@kernel.org>
References: <20261026124344.745124-1-loberman@redhat.com>
	 <20261026124344.745124-3-loberman@redhat.com>
	 <sashiko-outbox-185289@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QQuHEoN16uVG4kGPx4A_Xvu9HhEco1poFZdojg0Jpd0_1793022124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-10-26 at 13:13 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Critical] scsi: target: iscsi: UAF of OOO cmd in
> iscsit_check_dataout_payload()
> --
>=20
> commit 93e4d74df05b6ac07e171f5586d09d2036dc2494
> Author: Laurence Oberman <loberman@redhat.com>
>=20
> scsi: target: iscsi: Complete an aborted WRITE when a new R2T would
> be sent
>=20
> This commit completes an aborted WRITE command via
> iscsit_complete_aborted_cmd() in iscsit_check_dataout_payload() when
> iscsit_check_post_dataout() returns DATAOUT_SEND_R2T and no
> outstanding R2Ts
> remain.
>=20
> > diff --git a/drivers/target/iscsi/iscsi_target.c
> > b/drivers/target/iscsi/iscsi_target.c
> > index aab9237a67768..3dad7f69f3bae 100644
> > --- a/drivers/target/iscsi/iscsi_target.c
> > +++ b/drivers/target/iscsi/iscsi_target.c
> > @@ -1669,6 +1669,22 @@ iscsit_check_dataout_payload(struct
> > iscsit_cmd *cmd, struct iscsi_data *hdr,
> > =C2=A0=09if ((rc =3D=3D DATAOUT_NORMAL) || (rc =3D=3D
> > DATAOUT_WITHIN_COMMAND_RECOVERY))
> > =C2=A0=09=09return 0;
> > =C2=A0=09else if (rc =3D=3D DATAOUT_SEND_R2T) {
> > +=09=09/*
> > +=09=09 * A new R2T would never be answered for an
> > aborted command.
> > +=09=09 * The CMD_T_ABORTED handling in
> > __iscsit_check_dataout_hdr()
> > +=09=09 * does not cover this: it only runs for DataOut
> > PDUs
> > +=09=09 * belonging to R2Ts that were already issued, and
> > +=09=09 * iscsit_dataout_update_r2t() has already
> > decremented
> > +=09=09 * outstanding_r2ts for the burst that just
> > finished.=C2=A0 Guard
> > +=09=09 * on outstanding_r2ts so that with
> > MaxOutstandingR2T > 1 the
> > +=09=09 * completion is still left to the last R2T to
> > drain.
> > +=09=09 */
> > +=09=09if (cmd->se_cmd.transport_state & CMD_T_ABORTED) {
> > +=09=09=09if (cmd->outstanding_r2ts < 1)
> > +=09=09=09=09iscsit_complete_aborted_cmd(cmd);
> > +=09=09=09return 0;
> > +=09=09}
>=20
> [Severity: Critical]
> Can completing the command here cause a use-after-free of cmd if
> ICF_OOO_CMDSN is set?
>=20
> When ImmediateData=3DYes and InitialR2T=3DNo, a WRITE command can arrive
> with
> immediate data and expect additional unsolicited DataOut PDUs in the
> first
> burst followed by R2T-solicited data (payload_length <
> FirstBurstLength <
> se_cmd.data_length, so cmd->unsolicited_data =3D=3D 1 and
> ICF_NON_IMMEDIATE_UNSOLICITED_DATA is set).
>=20
> In drivers/target/iscsi/iscsi_target.c:iscsit_process_scsi_cmd(),
> transport_generic_new_cmd(&cmd->se_cmd) is called before CmdSN
> sequencing:
>=20
> =09cmd->sense_reason =3D transport_generic_new_cmd(&cmd->se_cmd);
> =09if (cmd->sense_reason)
> =09=09return 1;
>=20
> This places cmd->se_cmd on dev->queues[cpuid].state_list in
> TRANSPORT_WRITE_PENDING. When iscsit_get_immediate_data()
> subsequently calls
> iscsit_sequence_cmd() and cmd->cmd_sn > sess->exp_cmd_sn,
> drivers/target/iscsi/iscsi_target_erl1.c:iscsit_handle_ooo_cmdsn()
> queues
> an entry on sess->sess_ooo_cmdsn_list holding a raw pointer to cmd:
>=20
> =09cmd->cmd_flags=09=09=09|=3D ICF_OOO_CMDSN;
> =09...
> =09ooo_cmdsn->cmd=09=09=09=3D cmd;
>=20
> Because cmd->unsolicited_data is set, iscsit_get_immediate_data()
> then calls
> iscsit_set_unsolicited_dataout(cmd).
>=20
> If a concurrent TMR aborts cmd while it is still waiting on
> sess->sess_ooo_cmdsn_list, __target_check_io_state() sets
> CMD_T_ABORTED on
> cmd->se_cmd. When the final unsolicited DataOut PDU of the first
> burst
> arrives, __iscsit_check_dataout_hdr() takes the cmd->unsolicited_data
> =3D=3D 1
> path, and iscsit_dataout_post_crc_passed() clears cmd-
> >unsolicited_data =3D 0
> and returns DATAOUT_SEND_R2T.
>=20
> In this new DATAOUT_SEND_R2T branch in
> iscsit_check_dataout_payload(),
> cmd->outstanding_r2ts is 0, so iscsit_complete_aborted_cmd(cmd) is
> called
> without checking ICF_OOO_CMDSN or removing cmd from
> sess->sess_ooo_cmdsn_list (unlike the adjacent
> DATAOUT_SEND_TO_TRANSPORT
> branch, which checks cmd->cmd_flags & ICF_OOO_CMDSN).
>=20
> Once target_complete_cmd() schedules target_abort_work ->
> target_handle_abort(), cmd is completed and freed via
> iscsit_release_cmd().
> When the missing ExpCmdSN PDU later arrives,
> drivers/target/iscsi/iscsi_target_erl1.c:iscsit_execute_ooo_cmdsns()
> will
> dereference the dangling ooo_cmdsn->cmd pointer:
>=20
> =09=09cmd =3D ooo_cmdsn->cmd;
> =09=09cmd->i_state =3D cmd->deferred_i_state;
> =09=09ooo_count++;
> =09=09sess->exp_cmd_sn++;
> =09=09...
> =09=09iscsit_remove_ooo_cmdsn(sess, ooo_cmdsn);
>=20
> =09=09if (iscsit_execute_cmd(cmd, 1) < 0)
> =09=09=09return -1;
>=20
> Should the DATAOUT_SEND_R2T abort path also account for commands with
> ICF_OOO_CMDSN set before completing cmd?

I will drop patch 2 for this series as this turns out out be a real
issue and follow up with a v4 for the series. Dropping patch 2 will not
affect the validity of the fix with the over 300 reset loop tests we
ran which resolved the original customer issue.

Sashiko complaints for patches 1 and 4 are pre-existing and wont be
handled in this series.

It has taken many weeks to get to stable outcome for a customer that
included multiple long vmcore analysis tasks and instrumentation.


Thanks
Laurence

