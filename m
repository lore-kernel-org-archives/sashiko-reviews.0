Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045721;
	b=Fg41eC6dU5qaEZ9rr/o5c9Kkka6Lom27FKXYSxw3YQo9i0S39ZGXME+qdfrW+lDgcmts
	 GIGkYoke4ONYxXrKDZBWtS4kFc8apBgKtSJSQWQ+oM2qvxWnw6xGh8MW7ZF4HH9kpDaiy
	 Iowja/o7bYmX5kn5ZgYTuQZyblF2gfgXHwK7GKf4f89dECw7TI3oixpt59X3XcP3xUkih
	 gahTOw4RLYPE43kiTTWUq6XeqnDljVIvbAwehWKhSHb2M2W+6jAxC4CfeamE1/Pdq/Uv5
	 yZr+YeV8v2j8Xq5jrI73YdzCb5JpmVHe8emSovOVtQxUmsJXnVx3Zq7mEgt9RtoVyQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045721;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:User-Agent:
	 MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=mgGcQ48kITDsPWKAheo5+ry73wIWaOg+xNSXivkQtho=;
	b=D81GOfAzSRn+PXtgLHY8oF+Px62CCRxmundocpeRbPLJckzTJ9VJUMjEh2Sc3IcYBNkh
	 TWsy5CwM+S069KKO+FdojaR0ngtFA5gWFJBwUGmHHgi2ymxTEPjjpNGFa0BZ2Nx02c8QO
	 FIP9VNykCEXBQQi+I1HciRPLBcb/jJJ/VBjEjxNcKwyMv4+k42AG8rX7fiAenxcXBcxOt
	 FMA763PRqoVGlPbESMcM4cttczWmz34qfW87tYyxJbSHbYAppeMWHCUHeX6FxngCEYjm1
	 bDaFAl72oa40S2YSg9yIC4HSkry5YPuhmHx+rE5q7dJufywob/ataD9sX9H8YC6nt9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hGFhQW2N;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EEF606A31B
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 20:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EEF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hGFhQW2N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793045720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgGcQ48kITDsPWKAheo5+ry73wIWaOg+xNSXivkQtho=;
	b=hGFhQW2NFlYAz6/pVVdQyr/rjvC8ZJdFUJ57VXAwCaI23JTyfa1yXwQ+trkFGRk5KjpkXu
	OFvB6QrRUsYpq944fdREltxGBj/s8SDUlrcFY85/uxW50mbL20r4cQYv0kMDrN4H2HFsbU
	7lf4szZU1Do5PoX7uZ1AwcG9DETkxRQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-VOD_T6v4OZ2SmJdJrTaqZA-1; Mon, 26 Oct 2026 16:15:16 -0400
X-MC-Unique: VOD_T6v4OZ2SmJdJrTaqZA-1
X-Mimecast-MFC-AGG-ID: VOD_T6v4OZ2SmJdJrTaqZA_1793045716
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179743a76eso6457746d6.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 13:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793045716; x=1793650516;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBc5XRyll88oDqHTAiSqDmpJCercJbqZIVuAcy1oYe4=;
        b=PPK5iaBWEJs7uE38mYq8JdxBWByxwjnk06uXsBo38Zb0homsUPYcUvIyRfLW1v/LS9
         PEyXexKubi08f/zTcOyBfGADgDFl2W4pxPtS0QAY8igwcshwZspX8QJhhpS743SeuE+8
         9ElwyEk54J2pC8+tIAyyRWh2TD3ZL5rdMTrs8an79yihTM0b2Y29SEFluvQD8Ps6Y4Lq
         tPWCh8jUVvF22cnomdsGKpKLvT93YLG3otV/ZT+XjfCWh3yMT6dSuxE29swLSFAcOheY
         8oCVUoB8M0+CLB49p3mOGCsBbuyMTLzN/7TxBjMOdYD7YmWYHjR8volDPPcX+2QQR23i
         h7yw==
X-Gm-Message-State: AFq9FYIfR+cYKm4U3w3aJ/nwT/GsMLLYfzDspieCSRXSu2yKWhD7OjkR
	zk8Ofx+oBIdviO58flkixT0Hflz0n5dkJBiJ9/teYY6SOBgzSj8XB/MDAJGXU3mSfxoqTCjjg1q
	5ksQGpadSf9kEiSoLGcaEQY1HNnO/PuwW2not80aVWlbVlHrqdfsri/ceDHbPj0xQs/AilBHN4Z
	F2ZzLiBvCuOdxe2PyMYJnAiyeF8HK8Q+EQfp6C+866BJL0HdACxHi0SQ==
X-Gm-Gg: AYBFou2MjyxEewIR9fFRhSxISwK9fOSrmXZwF+DkpIOt6HvTzeVVOOHS3iWV2NfP+6d
	lAuKf5n0MhPBiNTqJUQPbWXWWVVdNymynlwCZtr94l008og2TClqBTWSKhK9+PZYeVMMHrKGcfo
	fJb/Io6O64etas1XTeT5CuqCFE1DjBateAEayv4LRif+v1rpn7qYKKT9Yql60QG0NFXp8p11lHn
	djWeK3XIhbkJOzeIw+Pgpmvmr3GW4TRmXTRb/NjTlft3m/kyqanrO0hJshWzYGs4mCOgr4Run1l
	9ux2wVvDL0ySY8oUjaYOUzJcVN5y/7v+4YKYzvf1LGWRkBfPslE+BZIPy8gdDTOmn53NZ9k+bdx
	b+LdXI9tQFxBpFR+869DizINPILyilog/FuPU608fgMYQMqXdgA8tBitcA9DBch/r3Ha0z2WgDz
	1lSA5VmayqwH8z4XfUj0vTSg==
X-Received: by 2002:a05:6214:8447:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-91c6d30f601mr9080246d6.21.1793045715377;
        Mon, 26 Oct 2026 13:15:15 -0700 (PDT)
X-Received: by 2002:a05:6214:8447:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-91c6d30f601mr9079356d6.21.1793045714566;
        Mon, 26 Oct 2026 13:15:14 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c129b2sm81631796d6.20.2026.10.26.13.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:15:13 -0700 (PDT)
Message-ID: <caf736526f8ff4dee2fb4e05200844ec02d641b6.camel@redhat.com>
Subject: Re: [PATCH v5 1/2] scsi: target: Complete an aborted command at
 most once
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, "Van Assche,
 Bart" <bvanassche@acm.org>
Date: Mon, 26 Oct 2026 16:15:13 -0400
In-Reply-To: <d0f9945fb5338ef81796e97777a5a8c4b7f8600b.camel@redhat.com>
References: <20261026192835.1431767-1-loberman@redhat.com>
		 <20261026192835.1431767-2-loberman@redhat.com>
		 <sashiko-outbox-185693@kernel.org>
	 <d0f9945fb5338ef81796e97777a5a8c4b7f8600b.camel@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 6Cp3WHUhYBuSo9H4gN-Dk6g0WB4jtw-jVDPL2DUyuQA_1793045716
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-10-26 at 16:04 -0400, Laurence Oberman wrote:
> On Mon, 2026-10-26 at 19:56 +0000, sashiko-bot@kernel.org=C2=A0wrote:
> > Thank you for your contribution! Sashiko AI review found 2
> > potential
> > issue(s) to consider:
> > - [High] scsi: target: double transport_complete_callback() via
> > CMD_T_STOP
> > - [High] scsi: target: unguarded abort queueing in
> > transport_generic_request_failure()
> > --
> >=20
> > commit 9f0a0fc8e2f216b4d0f91c9797ea14d9a91154f8
> > Author: Laurence Oberman <loberman@redhat.com>
> >=20
> > scsi: target: Complete an aborted command at most once
> >=20
> > This commit adds the CMD_T_ABORT_QUEUED flag under t_state_lock in
> > target_cmd_interrupted() so that an aborted command only runs its
> > completion
> > callback and queues target_abort_work once.
> >=20
> > > diff --git a/drivers/target/target_core_transport.c
> > > b/drivers/target/target_core_transport.c
> > > index 927861c30afc4..4896a92392e0e 100644
> > > --- a/drivers/target/target_core_transport.c
> > > +++ b/drivers/target/target_core_transport.c
> > > @@ -882,24 +882,45 @@ static void target_abort_work(struct
> > > work_struct *work)
> > > =C2=A0=09target_handle_abort(cmd);
> > > =C2=A0}
> > > =C2=A0
> > > +/*
> > > + * Returns true if the command has been aborted or stopped, in
> > > which case the
> > > + * caller must not carry on with normal completion.=C2=A0 For an
> > > aborted command the
> > > + * work that must not run twice -- the completion callback and
> > > the
> > > queueing of
> > > + * target_abort_work -- is done once, under CMD_T_ABORT_QUEUED.
> > > + */
> > > =C2=A0static bool target_cmd_interrupted(struct se_cmd *cmd)
> > > =C2=A0{
> > > +=09bool queue_abort =3D false, stop =3D false;
> > > +=09unsigned long flags;
> > > =C2=A0=09int post_ret;
> > > =C2=A0
> > > +=09spin_lock_irqsave(&cmd->t_state_lock, flags);
> > > =C2=A0=09if (cmd->transport_state & CMD_T_ABORTED) {
> > > -=09=09if (cmd->transport_complete_callback)
> > > -=09=09=09cmd->transport_complete_callback(cmd,
> > > false, &post_ret);
> > > +=09=09if (cmd->transport_state & CMD_T_ABORT_QUEUED) {
> > > +=09=09=09spin_unlock_irqrestore(&cmd-
> > > >t_state_lock,
> > > flags);
> > > +=09=09=09return true;
> > > +=09=09}
> > > +=09=09cmd->transport_state |=3D CMD_T_ABORT_QUEUED;
> > > +=09=09queue_abort =3D true;
> > > +=09} else if (cmd->transport_state & CMD_T_STOP) {
> > > +=09=09stop =3D true;
> > > +=09}
> > > +=09spin_unlock_irqrestore(&cmd->t_state_lock, flags);
> > > +
> > > +=09if (!queue_abort && !stop)
> > > +=09=09return false;
> > > +
> > > +=09if (cmd->transport_complete_callback)
> > > +=09=09cmd->transport_complete_callback(cmd, false,
> > > &post_ret);
> >=20
> > [Severity: High]
> > Can cmd->transport_complete_callback() still be called more than
> > once
> > when a
> > command hits the CMD_T_STOP path first?
> >=20
> > The commit message notes that leaving the CMD_T_STOP branch
> > unguarded
> > is
> > harmless because complete_all() is idempotent, and explains that a
> > first call
> > to target_cmd_interrupted() can take the CMD_T_STOP branch before
> > CMD_T_ABORTED
> > is set afterwards.
> >=20
> > However, target_cmd_interrupted() executes cmd-
> > > transport_complete_callback()
> > when either queue_abort or stop is true, without clearing the
> > callback pointer
> > or guarding its execution. In drivers/target/target_core_sbc.c,
> > both
> > compare_and_write_callback() and compare_and_write_post() release
> > dev->caw_sem
> > without clearing cmd->transport_complete_callback:
> >=20
> > drivers/target/target_core_sbc.c:compare_and_write_callback() {
> > =C2=A0=C2=A0=C2=A0 ...
> > out:
> > =09/*
> > =09 * In the MISCOMPARE or failure case, unlock ->caw_sem
> > obtained in
> > =09 * sbc_compare_and_write() before the original READ I/O
> > submission.
> > =09 */
> > =09up(&dev->caw_sem);
> > =09sg_free_table(&write_tbl);
> > =09return ret;
> > }
> >=20
> > If a first call to target_cmd_interrupted() takes the CMD_T_STOP
> > branch and a
> > subsequent call takes either the CMD_T_ABORTED branch (after
> > CMD_T_ABORTED is
> > set) or the CMD_T_STOP branch a second time, won't
> > cmd->transport_complete_callback() run twice and call up(&dev-
> > > caw_sem) a
> > second time?
> >=20
> > > +
> > > +=09if (queue_abort) {
> > > =C2=A0=09=09INIT_WORK(&cmd->work, target_abort_work);
> > > =C2=A0=09=09queue_work(target_completion_wq, &cmd->work);
> > > -=09=09return true;
> > > -=09} else if (cmd->transport_state & CMD_T_STOP) {
> > > -=09=09if (cmd->transport_complete_callback)
> > > -=09=09=09cmd->transport_complete_callback(cmd,
> > > false, &post_ret);
> > > +=09} else {
> > > =C2=A0=09=09complete_all(&cmd->t_transport_stop_comp);
> > > -=09=09return true;
> > > =C2=A0=09}
> > > =C2=A0
> > > -=09return false;
> > > +=09return true;
> > > =C2=A0}
> >=20
> > [Severity: High]
> > Does transport_generic_request_failure() in
> > drivers/target/target_core_transport.c also need to test and set
> > CMD_T_ABORT_QUEUED under cmd->t_state_lock?
> >=20
> > Commit 2c9fa49e100f ("scsi: target/core: Make ABORT and LUN RESET
> > handling
> > synchronous") added the same abort handling pattern to both
> > target_cmd_interrupted() and transport_generic_request_failure():
> >=20
> > drivers/target/target_core_transport.c:transport_generic_request_fa
> > il
> > ure() {
> > =C2=A0=C2=A0=C2=A0 ...
> > =09if (cmd->transport_complete_callback)
> > =09=09cmd->transport_complete_callback(cmd, false,
> > &post_ret);
> >=20
> > =09if (cmd->transport_state & CMD_T_ABORTED) {
> > =09=09INIT_WORK(&cmd->work, target_abort_work);
> > =09=09queue_work(target_completion_wq, &cmd->work);
> > =09=09return;
> > =09}
> > =C2=A0=C2=A0=C2=A0 ...
> > }
> >=20
> > Because transport_generic_request_failure() does not check or set
> > CMD_T_ABORT_QUEUED under cmd->t_state_lock, if CMD_T_ABORTED is set
> > after
> > target_cmd_interrupted() returns false in target_execute_cmd(), and
> > execution
> > then fails in target_write_prot_action() or __target_execute_cmd()
> > (for
> > example, when tcmu_queue_cmd() sees CMD_T_ABORTED and returns
> > TCM_CHECK_CONDITION_ABORT_CMD, or when target_scsi3_ua_check()
> > fails):
> >=20
> > drivers/target/target_core_transport.c:__target_execute_cmd() {
> > =C2=A0=C2=A0=C2=A0 ...
> > err:
> > =09spin_lock_irq(&cmd->t_state_lock);
> > =09cmd->transport_state &=3D ~CMD_T_SENT;
> > =09spin_unlock_irq(&cmd->t_state_lock);
> >=20
> > =09transport_generic_request_failure(cmd, ret);
> > }
> >=20
> > transport_generic_request_failure() will invoke
> > cmd->transport_complete_callback(), queue target_abort_work on cmd-
> > > work, and
> > return early without setting CMD_T_ABORT_QUEUED or
> > SCF_SENT_CHECK_CONDITION.
> >=20
> > If an iSCSI ERL=3D2 TMR TASK_REASSIGN then runs
> > iscsit_task_reassign_complete_write() in
> > drivers/target/iscsi/iscsi_target_tmr.c, it sees
> > ICF_GOT_LAST_DATAOUT
> > set and
> > CMD_T_SENT cleared, and calls target_execute_cmd() ->
> > target_cmd_interrupted():
> >=20
> > drivers/target/iscsi/iscsi_target_tmr.c:iscsit_task_reassign_comple
> > te
> > _write() {
> > =C2=A0=C2=A0=C2=A0 ...
> > =09if (cmd->cmd_flags & ICF_GOT_LAST_DATAOUT) {
> > =09=09if (!(cmd->se_cmd.transport_state & CMD_T_SENT)) {
> > =09=09=09pr_debug("WRITE ITT: 0x%08x: t_state: %d"
> > =09=09=09=09" never sent to transport\n",
> > =09=09=09=09cmd->init_task_tag, cmd-
> > > se_cmd.t_state);
> > =09=09=09target_execute_cmd(se_cmd);
> > =09=09=09return 0;
> > =09=09}
> > =C2=A0=C2=A0=C2=A0 ...
> > }
> >=20
> > Similarly, fabric error paths such as tcm_qla2xxx_write_pending(),
> > tcm_qla2xxx_handle_data_work(), and isert_rdma_read_done() call
> > transport_generic_request_failure() directly. Could these paths
> > reach
> > both
> > transport_generic_request_failure() and target_cmd_interrupted()
> > (or
> > transport_generic_request_failure() twice) for the same aborted
> > command,
> > re-initializing cmd->work while queued and running
> > cmd->transport_complete_callback() and target_handle_abort() a
> > second
> > time?
>=20
> Let me wait on Bart's review but I do see validity in what Sashiko is
> reporting. The complexity in this target code is really hard to deal
> with but I am doing my best. I will also see if I can get AI to check
> it fully first should I come up with a good response to the latest
> sashiko review
>=20
> Regards
> Laurence


Hello Bart
I decided to send this along to get some guidance before I finalize
something to deal with Sashiko's latest report.

The Sashiko review of v5 found two things against patch 1. I checked
both against the tree and the second one is a real hole in the patch,
so v6 will follow/

1. transport_generic_request_failure() queues target_abort_work too.

There are exactly two sites in target_core_transport.c that queue
target_abort_work -- target_cmd_interrupted() and
transport_generic_request_failure() -- and v5 guarded only the first.
2c9fa49e100f added the same pattern to both, so guarding one is half a
fix, and the path the review gives is reachable:
target_cmd_interrupted()
returns false because CMD_T_ABORTED is not set yet, execution then
fails
and transport_generic_request_failure() queues the work with nothing
recorded, and a later target_execute_cmd() -- from
iscsit_task_reassign_complete_write(), say -- queues it again. That is
the
re-queue-while-queued this series is supposed to prevent, so patch 1 as
posted did not hold up its own subject line.

v6 factors the test-and-set into __target_claim_abort() and uses it at
both sites. Patch 1's subject is now "Queue the abort of a command at
most
once", which is what it actually guarantees.

2. transport_complete_callback() is still not one-shot.

Also correct. It runs on both branches of target_cmd_interrupted() and
again in transport_generic_request_failure(), so a CMD_T_STOP call
followed by a CMD_T_ABORTED call runs it twice, as does a failure
arriving
after an abort has already been claimed. For COMPARE AND WRITE that is
a
second up(&dev->caw_sem).

This is existing behaviour rather than something the series introduces
--
mainline runs the callback on both branches today -- but patch 1 cites
the
caw_sem double release as part of its rationale, so it is fair to say
the
fix does not match its own description. I have not tried to close it in
v6, because the options are a second flag alongside CMD_T_ABORT_QUEUED
or
clearing cmd->transport_complete_callback after the first success=3Dfalse
call, and the latter affects target_complete_ok_work(), which calls the
same callback with success=3Dtrue.

Bart, since the claim is your design: which way would you want that
done, and should it be part of this series or a follow-up? Patch 1
describes the gap explicitly at the end so it is not left implied.

Thanks as always
Laurence


