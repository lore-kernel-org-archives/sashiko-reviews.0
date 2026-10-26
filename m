Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045055;
	b=Ed0HkVFR1+YPiUbKN9Gniphl3Gf+MCWiX4QT3l0FoSiu5l84lgUNWHXT6PvK5VyLA3wU
	 joVTJdBtqu94m22kUfZLwNRw2RQE+0YqI45xaB/9rzd5AJuBJq2Sq5xlPQofKpxqju6R1
	 LDbLO0izzCZA6j8Kehj+UAIt8ZsUTbzY18uZlgCS+uy2DQVB777z9N5NdIDCbpGiuAGcm
	 KZ/1VpaVkPmGnk0eBkiuKAmNzN3by+UHnqW/2YTj7xlRzQjmvrpSjRtqCfrzBmu21MBpG
	 CeiJuCNVgkJf5ZNHcZ2iq/kpUxUC3Pzb6V96NU8h6QZeI4fbUgtdtg3ADyylL4Kr4RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045055;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:User-Agent:
	 MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=pIGQYHOya3I2T1/hTITqLzL89FrdxItvQxreQpHmjmE=;
	b=xWnvVaNSwBvPdzCadYHvo8G1Dgr5Obi0REnrCg3osZmuyLFcOlW3ttfBikDrHCum2OXL
	 Ze8m351wXDsELvWeo5pAsZN35hbI3FvJD4hd0kyCq2RZkWVXOoK2wA7BhnVdGv3fTI7TB
	 ZgTxvpscnulOEGgUPmCw7+Huta0D0OwiX5r8qoL09MAu6u9YXv5IZRYV5UJCzT9eSVI03
	 icSxZFaTVVqOy2+BdWJfx1k23iPLUTK2kJzad/7vQNNMd6cf0T5aPtFn+m+ABbBB3UX6m
	 oSGFXyp8f9UHsssuD659xD04qPX2myVelXcrp3uzHGE2whvusGACHPh8NwTkl8oZzoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AUSI0kDU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA52606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 20:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA52606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AUSI0kDU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793045053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIGQYHOya3I2T1/hTITqLzL89FrdxItvQxreQpHmjmE=;
	b=AUSI0kDU43MxBqSo8bBhPCRkCCNc8Ni4ZMKn5eyawOHauZKe/IXV2/h8IVOeIQId5mmI2S
	p6TNiucIviZKDqzC/Kzeh63fOL35K8HtCKbVdav+zzg3ZiQI9ibzgvaSw9TZZZXKSM8D5C
	oCRWyxxReWA1yu5xuq1HDy3BYKDiyD8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-1-p_tyDhP3uK40uGFZ6DMw-1; Mon, 26 Oct 2026 16:04:12 -0400
X-MC-Unique: 1-p_tyDhP3uK40uGFZ6DMw-1
X-Mimecast-MFC-AGG-ID: 1-p_tyDhP3uK40uGFZ6DMw_1793045052
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so619502185a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 13:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793045052; x=1793649852;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EteNQ3QjnOcsX1B3Urg7UJN4lThZVIxHF8GjAs9LfFk=;
        b=siBkem4grWS0aoZt7kvBBXZpy8ZC0sMzHCJE7ouoWZZQ8ulOMRYaIOLkXsCFPmj+5f
         QLslasOygsNt5VDdB+CwqltnnrOR8+sZJvO4qDKsYlgJjZBHs7G0x8K7GuRX0Kpa8Lk9
         jP9t+xD4bnxiDQdh3s3XWnio+GMr7kXrHZKBDx8qdwuW4/Xiy5BTF/ipibRYB1o1EizK
         VZuzeFs5i2wZX5Itg/+av9LeaQ0ndNxVXJDCFZgGMaEzS9U1LzsP4TIDjgbVfA9xLTst
         cSOyHhW6X5oYijY2VnjVrKw1pr84PEHfs2Yyf8LhOcWND1u+LOJeyob6I/4ZOzmcariq
         035g==
X-Gm-Message-State: AFq9FYKviSpbiQezKVwmZCrYp3JJ+dMZVf0esjMj2btyN4xwnyh7K0QB
	VqiBQebYiesymEu7KPQE+nPyHApgICeqS/kNa1cC7si/1xB7moPIHu1tjKdPbwTu3qkdGyiWbTt
	WmMRwAztwF8Llw0OEAtC2KwI1gcWcfag7pk/g4NAzdt3Sa4C0SwD5wnGaXZvaGfZY9ZrBCU5QOB
	N4PDAygDBwNHJvoqg+QXXxfK/KGPbJzd3S6VRJKTumqoAARxmDF6+Fpw==
X-Gm-Gg: AYBFou0UXTcyIwYFdVH70yu6g6VRFQos0UlMB9W98w+it1dj1JjO920zuUylgZwAvQV
	SnQg4p9c3OCFeQGBLj6DgVX1QUSzzztZFM8+LY8Whj5cFcXtHqcyaPftrFHUefl20xe4OVC94kT
	vL1m9FibedASOZpoqJ4m2Kr+3ZE11dXCgk+hcCR1CrNEiOYNAcguOgfDK3JNiWxGcWt6pGfZnDr
	mcYyq37khbIoM6e14S1VgvDD7KDTssuI6Bl2f/+ePj83MyyU4OrjXFdAlpG+drippthtG571WEu
	lf7JX0bFYQxhpXXHuqTkbhACeTNQolk0VUcd3CCmYYS7sidD35SgyADHrZIp0JkJJZdo8E/blBt
	VXySGLuu67KcwYT1FVjAxWVfOp3qKPFm8RAxM93huDMEjMwEt6b5er8u6Z3wyj+JNXk6t107+Er
	0/2wr9U9xa+eQ3p2ovBf7RBg==
X-Received: by 2002:a05:620a:3949:b0:93e:7192:191c with SMTP id af79cd13be357-940ef91b69cmr1103805385a.17.1793045051704;
        Mon, 26 Oct 2026 13:04:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3949:b0:93e:7192:191c with SMTP id af79cd13be357-940ef91b69cmr1103796885a.17.1793045050972;
        Mon, 26 Oct 2026 13:04:10 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a7e5cfsm772481385a.37.2026.10.26.13.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:04:10 -0700 (PDT)
Message-ID: <d0f9945fb5338ef81796e97777a5a8c4b7f8600b.camel@redhat.com>
Subject: Re: [PATCH v5 1/2] scsi: target: Complete an aborted command at
 most once
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org
Date: Mon, 26 Oct 2026 16:04:09 -0400
In-Reply-To: <sashiko-outbox-185693@kernel.org>
References: <20261026192835.1431767-1-loberman@redhat.com>
	 <20261026192835.1431767-2-loberman@redhat.com>
	 <sashiko-outbox-185693@kernel.org>
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
X-Mimecast-MFC-PROC-ID: 8Kie3Xic2719oyDulbpIYw5oxmnlnqzOvoFiLl4D-PM_1793045052
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-10-26 at 19:56 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> - [High] scsi: target: double transport_complete_callback() via
> CMD_T_STOP
> - [High] scsi: target: unguarded abort queueing in
> transport_generic_request_failure()
> --
>=20
> commit 9f0a0fc8e2f216b4d0f91c9797ea14d9a91154f8
> Author: Laurence Oberman <loberman@redhat.com>
>=20
> scsi: target: Complete an aborted command at most once
>=20
> This commit adds the CMD_T_ABORT_QUEUED flag under t_state_lock in
> target_cmd_interrupted() so that an aborted command only runs its
> completion
> callback and queues target_abort_work once.
>=20
> > diff --git a/drivers/target/target_core_transport.c
> > b/drivers/target/target_core_transport.c
> > index 927861c30afc4..4896a92392e0e 100644
> > --- a/drivers/target/target_core_transport.c
> > +++ b/drivers/target/target_core_transport.c
> > @@ -882,24 +882,45 @@ static void target_abort_work(struct
> > work_struct *work)
> > =C2=A0=09target_handle_abort(cmd);
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * Returns true if the command has been aborted or stopped, in
> > which case the
> > + * caller must not carry on with normal completion.=C2=A0 For an
> > aborted command the
> > + * work that must not run twice -- the completion callback and the
> > queueing of
> > + * target_abort_work -- is done once, under CMD_T_ABORT_QUEUED.
> > + */
> > =C2=A0static bool target_cmd_interrupted(struct se_cmd *cmd)
> > =C2=A0{
> > +=09bool queue_abort =3D false, stop =3D false;
> > +=09unsigned long flags;
> > =C2=A0=09int post_ret;
> > =C2=A0
> > +=09spin_lock_irqsave(&cmd->t_state_lock, flags);
> > =C2=A0=09if (cmd->transport_state & CMD_T_ABORTED) {
> > -=09=09if (cmd->transport_complete_callback)
> > -=09=09=09cmd->transport_complete_callback(cmd,
> > false, &post_ret);
> > +=09=09if (cmd->transport_state & CMD_T_ABORT_QUEUED) {
> > +=09=09=09spin_unlock_irqrestore(&cmd->t_state_lock,
> > flags);
> > +=09=09=09return true;
> > +=09=09}
> > +=09=09cmd->transport_state |=3D CMD_T_ABORT_QUEUED;
> > +=09=09queue_abort =3D true;
> > +=09} else if (cmd->transport_state & CMD_T_STOP) {
> > +=09=09stop =3D true;
> > +=09}
> > +=09spin_unlock_irqrestore(&cmd->t_state_lock, flags);
> > +
> > +=09if (!queue_abort && !stop)
> > +=09=09return false;
> > +
> > +=09if (cmd->transport_complete_callback)
> > +=09=09cmd->transport_complete_callback(cmd, false,
> > &post_ret);
>=20
> [Severity: High]
> Can cmd->transport_complete_callback() still be called more than once
> when a
> command hits the CMD_T_STOP path first?
>=20
> The commit message notes that leaving the CMD_T_STOP branch unguarded
> is
> harmless because complete_all() is idempotent, and explains that a
> first call
> to target_cmd_interrupted() can take the CMD_T_STOP branch before
> CMD_T_ABORTED
> is set afterwards.
>=20
> However, target_cmd_interrupted() executes cmd-
> >transport_complete_callback()
> when either queue_abort or stop is true, without clearing the
> callback pointer
> or guarding its execution. In drivers/target/target_core_sbc.c, both
> compare_and_write_callback() and compare_and_write_post() release
> dev->caw_sem
> without clearing cmd->transport_complete_callback:
>=20
> drivers/target/target_core_sbc.c:compare_and_write_callback() {
> =C2=A0=C2=A0=C2=A0 ...
> out:
> =09/*
> =09 * In the MISCOMPARE or failure case, unlock ->caw_sem
> obtained in
> =09 * sbc_compare_and_write() before the original READ I/O
> submission.
> =09 */
> =09up(&dev->caw_sem);
> =09sg_free_table(&write_tbl);
> =09return ret;
> }
>=20
> If a first call to target_cmd_interrupted() takes the CMD_T_STOP
> branch and a
> subsequent call takes either the CMD_T_ABORTED branch (after
> CMD_T_ABORTED is
> set) or the CMD_T_STOP branch a second time, won't
> cmd->transport_complete_callback() run twice and call up(&dev-
> >caw_sem) a
> second time?
>=20
> > +
> > +=09if (queue_abort) {
> > =C2=A0=09=09INIT_WORK(&cmd->work, target_abort_work);
> > =C2=A0=09=09queue_work(target_completion_wq, &cmd->work);
> > -=09=09return true;
> > -=09} else if (cmd->transport_state & CMD_T_STOP) {
> > -=09=09if (cmd->transport_complete_callback)
> > -=09=09=09cmd->transport_complete_callback(cmd,
> > false, &post_ret);
> > +=09} else {
> > =C2=A0=09=09complete_all(&cmd->t_transport_stop_comp);
> > -=09=09return true;
> > =C2=A0=09}
> > =C2=A0
> > -=09return false;
> > +=09return true;
> > =C2=A0}
>=20
> [Severity: High]
> Does transport_generic_request_failure() in
> drivers/target/target_core_transport.c also need to test and set
> CMD_T_ABORT_QUEUED under cmd->t_state_lock?
>=20
> Commit 2c9fa49e100f ("scsi: target/core: Make ABORT and LUN RESET
> handling
> synchronous") added the same abort handling pattern to both
> target_cmd_interrupted() and transport_generic_request_failure():
>=20
> drivers/target/target_core_transport.c:transport_generic_request_fail
> ure() {
> =C2=A0=C2=A0=C2=A0 ...
> =09if (cmd->transport_complete_callback)
> =09=09cmd->transport_complete_callback(cmd, false,
> &post_ret);
>=20
> =09if (cmd->transport_state & CMD_T_ABORTED) {
> =09=09INIT_WORK(&cmd->work, target_abort_work);
> =09=09queue_work(target_completion_wq, &cmd->work);
> =09=09return;
> =09}
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Because transport_generic_request_failure() does not check or set
> CMD_T_ABORT_QUEUED under cmd->t_state_lock, if CMD_T_ABORTED is set
> after
> target_cmd_interrupted() returns false in target_execute_cmd(), and
> execution
> then fails in target_write_prot_action() or __target_execute_cmd()
> (for
> example, when tcmu_queue_cmd() sees CMD_T_ABORTED and returns
> TCM_CHECK_CONDITION_ABORT_CMD, or when target_scsi3_ua_check()
> fails):
>=20
> drivers/target/target_core_transport.c:__target_execute_cmd() {
> =C2=A0=C2=A0=C2=A0 ...
> err:
> =09spin_lock_irq(&cmd->t_state_lock);
> =09cmd->transport_state &=3D ~CMD_T_SENT;
> =09spin_unlock_irq(&cmd->t_state_lock);
>=20
> =09transport_generic_request_failure(cmd, ret);
> }
>=20
> transport_generic_request_failure() will invoke
> cmd->transport_complete_callback(), queue target_abort_work on cmd-
> >work, and
> return early without setting CMD_T_ABORT_QUEUED or
> SCF_SENT_CHECK_CONDITION.
>=20
> If an iSCSI ERL=3D2 TMR TASK_REASSIGN then runs
> iscsit_task_reassign_complete_write() in
> drivers/target/iscsi/iscsi_target_tmr.c, it sees ICF_GOT_LAST_DATAOUT
> set and
> CMD_T_SENT cleared, and calls target_execute_cmd() ->
> target_cmd_interrupted():
>=20
> drivers/target/iscsi/iscsi_target_tmr.c:iscsit_task_reassign_complete
> _write() {
> =C2=A0=C2=A0=C2=A0 ...
> =09if (cmd->cmd_flags & ICF_GOT_LAST_DATAOUT) {
> =09=09if (!(cmd->se_cmd.transport_state & CMD_T_SENT)) {
> =09=09=09pr_debug("WRITE ITT: 0x%08x: t_state: %d"
> =09=09=09=09" never sent to transport\n",
> =09=09=09=09cmd->init_task_tag, cmd-
> >se_cmd.t_state);
> =09=09=09target_execute_cmd(se_cmd);
> =09=09=09return 0;
> =09=09}
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Similarly, fabric error paths such as tcm_qla2xxx_write_pending(),
> tcm_qla2xxx_handle_data_work(), and isert_rdma_read_done() call
> transport_generic_request_failure() directly. Could these paths reach
> both
> transport_generic_request_failure() and target_cmd_interrupted() (or
> transport_generic_request_failure() twice) for the same aborted
> command,
> re-initializing cmd->work while queued and running
> cmd->transport_complete_callback() and target_handle_abort() a second
> time?

Let me wait on Bart's review but I do see validity in what Sashiko is
reporting. The complexity in this target code is really hard to deal
with but I am doing my best. I will also see if I can get AI to check
it fully first should I come up with a good response to the latest
sashiko review

Regards
Laurence

