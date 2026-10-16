Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D125B09C
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154872; cv=none; b=NQLWeYDLbW25i2CHieVloHeSvhh0sjnD/OBpRo1oE7A67ACQUyYpQQ6KDxdq8ZrX6ZmgdwxmNx2cS+ORvcgTx7LY4jCdBqYJ3JP+N8Xvq/NNs8fUlpMqtKmnNJIMM16rL3To9Vltev7rqDbWFXWUsN1v44g4OXH20CopvCgNXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154872; c=relaxed/simple;
	bh=zozilBwLRFf1udFkZOZoT6Iv2ExcOJ7abBndWfgcfWs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKmgFY7L4CM0AM6Z9H7XgruRk2xqNIQUvf86ZVzGTM72DPhZjFVn095apA85dSVTkeukUeJGOPPF9i1fTn/OYTaJ+iDghI0wQj5cOxEa/2+NB44moK/OKHp9bdbDkcmXNqHwF3vVEfl0RZ2370C/V7BAkBepOIFvrIwSwfNePco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZYR2Qdge; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYR2Qdge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792154868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zozilBwLRFf1udFkZOZoT6Iv2ExcOJ7abBndWfgcfWs=;
	b=ZYR2Qdge4iDesjHlU/qIrOnzuzUYM8+NILo6OTf1lcQJPkCwEVCou+SmjpV9Hd2vGCj9/e
	YQBf4joEeNqvBzZIdmkuqafZDGco6nsHKU8HbjJEA/CFPy1f8zBP45xXc9sTcGr5L/LtpN
	71VgFvyS9SZIpbxJRx0CJm2Z+fAJt9Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-oIuIjhniPwmue3zolQyuSw-1; Fri, 16 Oct 2026 12:47:47 +0000
X-MC-Unique: oIuIjhniPwmue3zolQyuSw-1
X-Mimecast-MFC-AGG-ID: oIuIjhniPwmue3zolQyuSw_1792154867
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a510b22fso135225936d6.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 05:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154867; x=1792759667;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Vb6qcm8agLiGe0PZ+zUn2KiSsmzJFEb3kjQ/6YcLrk=;
        b=Yv+ihpR4/4LAtNO+BX6r1vlzGeTZNMqzZmpvDF7X7j1s8y4ARbRdmQ5JU22rtf4I+M
         h6lg7gSwu1ecgq4+2YkXJy2sY6srrniEdkVCec+VU0q6G9Qp/w90SJjiRj1IwWKTp5gq
         lobZ39M/8H3i5MGGssusHbdT+/eVRad1+D2Fy/dwqgz4ZP1bQ2M+1niGX5OnRcOb9Hnz
         7uIbPP4MY8hxbf96uj7BY/JX2BG7xBoYBbT/57/W7l8IqpFtlXN+5+tgWU4P3HSI6yIr
         YrdPMRxJM1BlMJhj6nP0urVmIALPcLAiuqjhMo2IeJxItaQnojIwRI6DC9+S/PiUs1Wa
         6WWA==
X-Gm-Message-State: AFq9FYKzeRKBBO2STNcCFCvANpRMKK8H7nX+wLBGok7vTTRVeVEgm+eu
	kveIQSgnduUv6B3RbH8DSRZSRQcaIB99h+PRAIZ6DmbIZTcR0qls8f2tau/PUiZbVnwSavy8gv6
	GS06pW65xaH+fv2/gsoYUcTJhpef78q3emUyi7z5obrh7VgYFAOwm787Ng3a5nkCXPxMBvO0s99
	q7hHxVBQTb9JJApvJRLJKdPR9L0Jitvdn4xR4Lsn1B4SaEYHjSKD5fiw==
X-Gm-Gg: AYBFou3SpNcneQ6mSIOuzcgj044CD8MeEYmCwdAIoL8Mj4pUSqIhxOmaO3DdUEzyrYN
	W2DTb8oQgHgk20iENQrrNTKi9InVkORX8vGe1Mear1YyVWJxJK5nlcwHOehqXzCYkUeD3UT9B2a
	wWo4D+RQmeTQRbJn6BubbCgGw9CVU51IfVhXbTX761nbIu2TS6z2yAIAP9wT8O/W3NCV4ebLnEN
	G6aLkPB+eH/g8C8RubLX7GdJoN7Wz88SO8ypX1XhIeO0VnaOaR3pRN9xuwaUpZ9WdDzIKslO034
	IJGR3/ZpsU1MZkD3zeyPys0/yZOvd9bxRB/j9EkvW9Fh+OD/fgbMjab1wxxJG1riMr8LdhbKFHc
	xrSLEDPCbjuEVvTqWAPyuStr9u2i/LF+mHG8=
X-Received: by 2002:a05:6214:b6e:b0:91b:8870:3931 with SMTP id 6a1803df08f44-91b88703a2amr244836726d6.34.1792154866968;
        Fri, 16 Oct 2026 05:47:46 -0700 (PDT)
X-Received: by 2002:a05:6214:b6e:b0:91b:8870:3931 with SMTP id 6a1803df08f44-91b88703a2amr244836066d6.34.1792154866215;
        Fri, 16 Oct 2026 05:47:46 -0700 (PDT)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([2600:6c65:2440:d8c:929c:b769:6def:faa3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbae22d0sm22168846d6.28.2026.10.16.05.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:47:45 -0700 (PDT)
Message-ID: <bfe54bc7b8fdc023903933410c851576c00bea16.camel@redhat.com>
Subject: Re: [PATCH 2/2] scsi: target: iscsi: Complete an aborted WRITE when
 a new R2T would be sent
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org
Date: Fri, 16 Oct 2026 08:47:44 -0400
In-Reply-To: <sashiko-outbox-171452@kernel.org>
References: <20261014143932.39453-1-loberman@redhat.com>
	 <20261014143932.39453-3-loberman@redhat.com>
	 <sashiko-outbox-171452@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oTxZp8JdOoojw60WKeEPykXW5NQHfBlvrUjmom845MI_1792154867
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-10-14 at 15:00 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] iscsi: workqueue corruption via double completion of aborted
> cmd
> --
>=20
> commit 1cef49db01d5c1eb5e9670fc6f016dfd14ddd5cd
> Author: Laurence Oberman <loberman@redhat.com>
>=20
> scsi: target: iscsi: Complete an aborted WRITE when a new R2T would
> be sent
>=20
> iscsit_check_dataout_payload() hands a command to
> iscsit_get_dataout() to
> request the next burst whenever iscsit_check_post_dataout() returns
> DATAOUT_SEND_R2T, without checking CMD_T_ABORTED first. This patch
> guards
> for aborted commands by stopping the dataout timer and completing the
> command.
>=20
> > diff --git a/drivers/target/iscsi/iscsi_target.c
> > b/drivers/target/iscsi/iscsi_target.c
> > index aab9237a67768..87b215b18034e 100644
> > --- a/drivers/target/iscsi/iscsi_target.c
> > +++ b/drivers/target/iscsi/iscsi_target.c
> > @@ -1669,6 +1669,25 @@ iscsit_check_dataout_payload(struct
> > iscsit_cmd *cmd, struct iscsi_data *hdr,
> > =C2=A0=09if ((rc =3D=3D DATAOUT_NORMAL) || (rc =3D=3D
> > DATAOUT_WITHIN_COMMAND_RECOVERY))
> > =C2=A0=09=09return 0;
> > =C2=A0=09else if (rc =3D=3D DATAOUT_SEND_R2T) {
> [ ... ]
> > +=09=09if (cmd->se_cmd.transport_state & CMD_T_ABORTED) {
> > +=09=09=09if (cmd->outstanding_r2ts < 1) {
> > +=09=09=09=09iscsit_stop_dataout_timer(cmd);
> > +=09=09=09=09target_complete_cmd(&cmd->se_cmd,
> > +=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0
> > SAM_STAT_TASK_ABORTED);
>=20
> [Severity: High]
> Can calling target_complete_cmd() directly on an aborted command
> bypass the
> synchronization wrapper iscsit_complete_aborted_cmd()?
>=20
> Because this bypasses iscsit_claim_completion_locked(), could
> concurrent
> session teardown or other abort paths also claim the command and call
> target_complete_cmd()?
>=20
> This concurrent modification could lead to target_cmd_interrupted()
> executing
> INIT_WORK(&cmd->work, target_abort_work) and queue_work()
> concurrently on an
> already active work item, which might destroy the workqueue linked
> list.
>=20
> There is also a preexisting location in the header parsing path that
> exposes
> the same unsynchronized completion race, which appears to have been
> copied
> here and left unfixed:
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
> Would it be safer to use iscsit_complete_aborted_cmd() in both places
> to
> ensure the completion is safely claimed?
>=20
> > +=09=09=09}
> > +=09=09=09return 0;
> > +=09=09}
> > +
> > =C2=A0=09=09iscsit_set_dataout_sequence_values(cmd);

Thanks for the review - you are right, and unlike the companion finding
against patch 1 this one is a defect this series introduces rather than
inherits.

The new completion in the DATAOUT_SEND_R2T branch calls
target_complete_cmd() directly and so never sets completion_claimed.
After it runs, the command is still in TRANSPORT_WRITE_PENDING and
still
on conn->conn_cmd_list until target_abort_work reaches
iscsit_aborted_task(). A connection drop in that window lets
iscsit_release_commands_from_conn() claim the command successfully and
complete it a second time, which is exactly the sequence you describe.

v2 will route it through iscsit_complete_aborted_cmd():

=09if (cmd->se_cmd.transport_state & CMD_T_ABORTED) {
=09=09if (cmd->outstanding_r2ts < 1)
=09=09=09iscsit_complete_aborted_cmd(cmd);
=09=09return 0;
=09}

The helper already performs iscsit_stop_dataout_timer() followed by
target_complete_cmd(), so the claimed path is unchanged and only the
second completion is suppressed. It also gives the helper a second
caller, which it should have had in this version.

Worth noting for the record that instrumented kernels logged this site
firing zero times across two independent 300-cycle validation runs, so
the change does not disturb the path that was actually exercised during
testing. The validated fix is the iscsit_execute_cmd() site in patch 1,
which v2 leaves alone.

On the pre-existing location in __iscsit_check_dataout_hdr(): I agree
it
has the same shape, and the lock context there allows the helper
(iscsit_stop_dataout_timer() sleeps at that point, so t_state_lock is
already dropped). I would prefer to handle it in a separate patch
rather
than fold it into this series - it is a distinct pre-existing race in
code this series does not otherwise touch. I have replied on the patch
1 thread with the reasoning.

Thanks
Laurence

