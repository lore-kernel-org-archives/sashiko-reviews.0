Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D51B42255C
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154794; cv=none; b=Sk0GzBHSX7JvFDkecYG07pJH66ans5nQ+Vs+ZLrVkZmjA0oYURfCnbz7bRoNnqTvFdOH+F/22JpgDuCQd/Y/B1ps2Ru6xOo8XI4wVDrL7hGQvDzprx3AUsaMPYWyI1FGHXqM7ueLeQY/6Vria1m9YROdxAkVotmFnmGyP3GXD08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154794; c=relaxed/simple;
	bh=gVjUEPHa1PYZTI+nIfsEUFd5Y9f2nK15hNfrXyxF6Y8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uA7Je2/jhgPjmjVGasyrzhyTSZvihcjhEpIFDLYljIniSziq+D5U6MOKiNa+hqMp5W007zKgYdl3VePR+bcqc6IcqojWRavPJ4AYwI0RVl9JnHszDrmiWy0uLzE+M8F+xIFS7289X9rcbdkzWMIX3BQUYA33ORuS+it9H7Eb31c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1D17518; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1D17518"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792154790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gVjUEPHa1PYZTI+nIfsEUFd5Y9f2nK15hNfrXyxF6Y8=;
	b=D1D17518Z163+5v1N9B8phNuGX4M4XtpH3HcOzumEmHuup9DbhcCgIC13HNazvdnQII5Dx
	giVK2BMvt+LUJxvbLU6UeHVWocICnkawIto5OEf07VvPJD/S3pn0lNs5uEvdRjhZITQXey
	O81uDF2cwit7kXdABsRB/eTx59kc0Ig=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-2C2V-uNXONaQ7-ZzrXlNEA-1; Fri, 16 Oct 2026 12:46:29 +0000
X-MC-Unique: 2C2V-uNXONaQ7-ZzrXlNEA-1
X-Mimecast-MFC-AGG-ID: 2C2V-uNXONaQ7-ZzrXlNEA_1792154789
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so1340366885a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 05:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154788; x=1792759588;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXE5vMlJLDULz4QabdUZcN7zMUliDBSGHX5ZEXcYJUA=;
        b=jhtMxpkE0/hGRdOJ9LYfDAhuKQrfkmorGSj3oL+v7oCoiiRu+PeTBQZlNghc5rgoaL
         bircVIlREf2QiBcgbVpTQLLr9XiaXS1QA6o87RyKMy4SKop13ij/n9G4xYvZLxxk6w3x
         VAoF5bYQt2DL2tgA2wQYDPRkiY5e5hf6sEnWFzLVPd4JhjRn1QiCzUs3yZMzn+xHuhWU
         z+dqmp6ZZR2mSaQJjOHibn71XYlV5Pfrmgm9INv4RdoK94SFrwqKJl08axERHZ1OkcQ9
         Tgf9L1EHuGurhMAgmQNg2rG9jBD/KXY4dUqTNzdbauf1Ry9mk9iTROTjSRRxWPtwOFg/
         87NQ==
X-Gm-Message-State: AFq9FYJSW8qjXdlY0KC3N3R3InxP/hK+cIJou8Mpt3bHP7ifPQO51khI
	U6lknlBAaRIk9araPJH3T4yM0NZmLUNO68nb0msd/cc+Q+BfEKhlkHmTm/nmz2kAYQhWT6Du+f2
	Lm6nOzAVESCOwCRYUQ/jEmceg3YrmveG/CLgEc2rqkUUvR/Jg7Hkd3ifgJuJD5Q3B0e8yR+AWk9
	Cc7XJqPDl1Zs02PYifdANVppIHRBlNS3CyoQTZtyJ+apdrhAAiPnIEvw==
X-Gm-Gg: AYBFou3UYKN0ybgkegUj1W/H2PhwqCWJ5gDALoB4ty2lZ1Z3x/UVUNqXgbgrm+JSt8y
	Cs4B1du+u8qUemENGp0kHggqtgC3l8Grx9hkBesbNNsrGR/5GQsxpLkTL7OErD3sHOrsRLVfGvs
	Qd4SI1Pi0ibImZKYf0YDRYgN0Pesi62G9VBTa9GhnHVqm2a4Ijkw75YQ5HS5pBSz0gQ61cyonoq
	5Dy2i4w70ZwyXrx+6OwPlrL/WeFu06rp07MkM7g92cYnB91mQJgIKU/KjS70qqC4RNw5REshdB/
	/00yFmZFk0ZEbShbktGhOJjvb6uFl9kjyLDyJ9KxjZRUzDdDJuuoc2ghlhxsc3AbRUQ5EqoTg5o
	LN/HXMsm7P9G5BPIlYVwX5fHTkoKC+o7pRrw=
X-Received: by 2002:a05:620a:198d:b0:93e:66db:69b9 with SMTP id af79cd13be357-93ebd23ab8emr3416425185a.55.1792154788455;
        Fri, 16 Oct 2026 05:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:93e:66db:69b9 with SMTP id af79cd13be357-93ebd23ab8emr3416418785a.55.1792154787746;
        Fri, 16 Oct 2026 05:46:27 -0700 (PDT)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([2600:6c65:2440:d8c:929c:b769:6def:faa3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16b5e4sm201356085a.14.2026.10.16.05.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:26 -0700 (PDT)
Message-ID: <8e325cc7ca21d607b3664debcaa5f14b273b91b6.camel@redhat.com>
Subject: Re: [PATCH 1/2] scsi: target: iscsi: Complete an aborted WRITE
 stuck before the first R2T
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org
Date: Fri, 16 Oct 2026 08:46:25 -0400
In-Reply-To: <sashiko-outbox-171458@kernel.org>
References: <20261014143932.39453-1-loberman@redhat.com>
	 <20261014143932.39453-2-loberman@redhat.com>
	 <sashiko-outbox-171458@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ELvgE2Tw_FT6D8iyPFuoqWtU-H9Gok6lj5CAKWO_VyY_1792154789
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-10-14 at 15:10 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] iscsi: double completion and workqueue corruption for
> aborted WRITEs on DataOut path
> --
>=20
> commit 7b04f6989363db2c2b75d8c212ee852153982c8d
> Author: Laurence Oberman <loberman@redhat.com>
> =C2=A0=C2=A0=C2=A0=20
> scsi: target: iscsi: Complete an aborted WRITE stuck before the first
> R2T
>=20
> This patch resolves an issue where an aborted WRITE command that
> arrives with
> immediate data exceeding FirstBurstLength gets stuck in
> TRANSPORT_WRITE_PENDING.
> It accomplishes this by completing the command in
> iscsit_execute_cmd() and
> introducing a new iscsit_claim_completion_locked() helper to avoid a
> double
> completion race with iscsit_release_commands_from_conn().
>=20
> > diff --git a/drivers/target/iscsi/iscsi_target.c
> > b/drivers/target/iscsi/iscsi_target.c
> > index 124ff269b8e75..aab9237a67768 100644
> > --- a/drivers/target/iscsi/iscsi_target.c
> > +++ b/drivers/target/iscsi/iscsi_target.c
> > @@ -4198,10 +4198,18 @@ static void
> > iscsit_release_commands_from_conn(struct iscsit_conn *conn)
> > =C2=A0=09=09if (cmd->se_cmd.t_state =3D=3D
> > TRANSPORT_WRITE_PENDING) {
> > =C2=A0=09=09=09/*
> > =C2=A0=09=09=09 * We never submitted the cmd to LIO core,
> > so we have
> > -=09=09=09 * to tell LIO to perform the completion
> > process.
> > +=09=09=09 * to tell LIO to perform the completion
> > process --
> > +=09=09=09 * unless iscsit_execute_cmd() already
> > did.=C2=A0 t_state
> > +=09=09=09 * stays TRANSPORT_WRITE_PENDING across
> > that
> > +=09=09=09 * completion, so the claim is the only
> > thing that can
> > +=09=09=09 * tell us.
> > =C2=A0=09=09=09 */
> > +=09=09=09bool claimed =3D
> > iscsit_claim_completion_locked(cmd);
> > +
> > =C2=A0=09=09=09spin_unlock_irq(&se_cmd->t_state_lock);
> > -=09=09=09target_complete_cmd(&cmd->se_cmd,
> > SAM_STAT_TASK_ABORTED);
> > +=09=09=09if (claimed)
> > +=09=09=09=09target_complete_cmd(&cmd->se_cmd,
> > +=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0
> > SAM_STAT_TASK_ABORTED);
>=20
> [Severity: High]
> Does this code miss the DataOut paths?
>=20
> Because target_complete_cmd() is called directly in
> __iscsit_check_dataout_hdr()
> and target_execute_cmd() is called in iscsit_check_dataout_payload()
> for aborted
> commands without setting the completion_claimed flag.
>=20
> If a command is aborted on the DataOut path:
>=20
> drivers/target/iscsi/iscsi_target.c:__iscsit_check_dataout_hdr() {
> =C2=A0=C2=A0=C2=A0 ...
> =09=09if (se_cmd->transport_state & CMD_T_ABORTED) {
> =09=09=09if (hdr->flags & ISCSI_FLAG_CMD_FINAL &&
> =09=09=09=C2=A0=C2=A0=C2=A0 --cmd->outstanding_r2ts < 1) {
> =09=09=09=09iscsit_stop_dataout_timer(cmd);
> =09=09=09=09target_complete_cmd(se_cmd,
> SAM_STAT_TASK_ABORTED);
> =09=09=09}
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Because completion_claimed is never set, target_complete_cmd()
> delegates
> to target_cmd_interrupted() which queues target_abort_work but leaves
> the command in TRANSPORT_WRITE_PENDING.
>=20
> If the connection drops before target_abort_work removes the command
> from the connection list, iscsit_release_commands_from_conn() will
> find it,
> iscsit_claim_completion_locked() will return true, and it will call
> target_complete_cmd() a second time.
>=20
> Can this double call to target_complete_cmd() cause
> target_cmd_interrupted()
> to re-initialize and re-queue cmd->work while it is already pending
> on the
> workqueue, leading to workqueue linked-list corruption and a use-
> after-free
> when target_handle_abort() runs twice?
>=20
>=20
Thanks for the review. I verified the mechanism and it is accurate:
target_cmd_interrupted() queues target_abort_work and returns true, and
target_complete_cmd_with_sense() then returns before reaching the
"cmd->t_state =3D TRANSPORT_COMPLETE; cmd->transport_state |=3D
CMD_T_COMPLETE" block. The command is left in TRANSPORT_WRITE_PENDING
with nothing recorded to say it has been completed. The window is also
not narrow: iscsit_release_commands_from_conn() holds conn->cmd_lock
across its entire walk and iscsit_aborted_task() needs that same lock
to
unlink, so if the work item has not run yet, teardown is guaranteed to
see the command rather than merely likely to.

Your point about target_execute_cmd() is correct as well, and worth
spelling out: it calls target_cmd_interrupted() before setting
cmd->t_state =3D TRANSPORT_PROCESSING, so an aborted command taking the
DATAOUT_SEND_TO_TRANSPORT path also stays in TRANSPORT_WRITE_PENDING.

However, this exposure is pre-existing rather than introduced here.
Mainline at that site today is:

=09if (cmd->se_cmd.t_state =3D=3D TRANSPORT_WRITE_PENDING) {
=09=09spin_unlock_irq(&se_cmd->t_state_lock);
=09=09target_complete_cmd(&cmd->se_cmd,
SAM_STAT_TASK_ABORTED);
=09=09continue;
=09}

The call is unconditional, so a command already completed by
__iscsit_check_dataout_hdr() or by target_execute_cmd() is completed a
second time by teardown as the code stands. This patch gates that call
on the claim, and for a command arriving from either of those paths the
claim succeeds, because neither path claims. Behaviour for them is
therefore identical to mainline. The only change is that the site this
patch adds in iscsit_execute_cmd() can no longer be double-completed.

So the patch removes one reachable double completion and adds none. I
would rather not extend it to cover the two pre-existing sites: this
series has 300 reset cycles of customer validation behind it on a
reproducer that previously failed at 95 and 196 cycles, and widening it
would mean shipping code that validation never exercised. I am happy to
post a separate patch for the pre-existing paths, on its own merits.

The companion finding against patch 2 is a real defect introduced by
this series and I am fixing it in v2.

Thanks
Laurence

