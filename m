Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6366C48DB58
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174776; cv=none; b=LF8COcYQ1Qcq3ygOz1i59w7Y2IlqXGVFjU8jhjSnchpYv+j2C3/FhwRDDIuY1PEAdnGrlwlhN5OLtemBNpnfEjSPbtyP+GfnLWnlnY/qlS2rT7NgoNmSSfE1dnTxKYS6XKxl+kM5lFnD6ZWDk/SY7D03vNml6ZBHshtjcuUE5dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174776; c=relaxed/simple;
	bh=TqRikmZ7csnCrB2weXFoz6tgf/kuh932e1T8CMYxEYQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bTPlRJwSydAwedFEEbaFwNFFhWwOFQhfutDqIW84BnyTKCagu1n+O7ujdFA1ogg5q5nk6yqJ79Xr3XWs0xIJmhCWsEnAHCnpbZeuMtaZbpQOkfpmHkBg6Xghml+v516COL+Q+l2o6wMcaVuTiA5fwXfLBD4OVqgVPHNBstRgiH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GI6vPu+0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GI6vPu+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792174773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqRikmZ7csnCrB2weXFoz6tgf/kuh932e1T8CMYxEYQ=;
	b=GI6vPu+0g0oDv1JMJZdQkY/rylMcwHdht1qniN3NalM4coD2tbTFptUMlzi3TEyD3LAl44
	tw8+4o/8OSGsUUFlo6exCRw+VMZxBMZ+63xfpe4hmx+nbbQMSt+mhgbniHGtWwH7Kq6GyD
	tn8MyYWgzHnzet1Lu/hNFA13uRGmNys=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-DmO2Q3l9OrCIoZZ-HBTaew-1; Fri, 16 Oct 2026 18:19:32 +0000
X-MC-Unique: DmO2Q3l9OrCIoZZ-HBTaew-1
X-Mimecast-MFC-AGG-ID: DmO2Q3l9OrCIoZZ-HBTaew_1792174771
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53639e47be2so3313811cf.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 11:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792174771; x=1792779571;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdkPrYJMoXNxnJJGpG2AJm7Q5jz36VYFDAVyz4PxPS0=;
        b=QOmDhQGLa6l92CC36ibPJOhCeOuMovbGvZrRskmzf4ZVG1XqiiTUxXInCMmDscSLSf
         aTzRSFXDj/sYylJwo0viJOIXveX/4OlM0CaDQZSs+nRHbR7yH27arplFwIZQWAD+c4Dq
         wW+POq+nFroSbzmf9LYdQdHsbLfHTEeF4T8geWFupperhJYlYwKKNWJ449YaI5ae3o2j
         jGdJXCuABmlimbCzqjGHqPMLxiNpcYDJZmHKkCqLvePPGLggrWV86htIk6CBK3p2ZI2+
         NqoIVpPTxpDZ3IhaCtpXoEFIuGCs8Q3fDYnRyMpWqq9fPfBWExuwTgD5r+l6bnBbZ0Tc
         Qx0Q==
X-Gm-Message-State: AFq9FYKdOdjKv+UejfXxaK4X1U30nDSePzIFwWp5ktThJzIvEgIJscUK
	1wHCWNSLq9wVXLHZnhLOLrGMfunDC3xhvBOKbo5mdQWE24NRllV5nMe2HUY55UbgWqtzobhR4RW
	o8OOx7/HCd7YAFeIDHf5lJt0THovwVXrEPMtf8En9KfasaHZf74raaRsSRVIKEnG6jJTDMlborX
	n/1QH2F4Lt6w61KEKoe2/v4mj5tzWQxl2Gj8CDISh6YZd6yjrzu+Momg==
X-Gm-Gg: AYBFou29I5C9Se8FftnhqSFmwGhgA/jPqX+NchfA2mC7IGR1DC5Tvhf4PyzBEywwNw/
	uZc2y5BQNAKnh0qmdTa3/151bWuvxoEwqH2EAOTAzzyYmO1V5Oel5/48NV9lnvVAuDEUNuGewN3
	0BWI2BgwYg+mB9I/AsL6IQ94z4ZwXXB+AM/EplrToR81sxMn9By8W7u4TwRZ2jFXExnd+HD/Vwt
	Nfls5cFWWiGJT75wH9bTW38fXDpcd7kfXhbFJYjD4+2nKo0U6owqUZDUdzELiMCUUcyMizv1tcl
	DKj/LIomtqpm5pbGCUgPy2maT8OOOc1/014nry8muqVxShSZX/PP8EySOsv5krqOq49kVoS0PtR
	CgQB34dAD24di30lQMXbNoBhKQeRpXgJx4RRP
X-Received: by 2002:a05:622a:4897:b0:533:9753:571c with SMTP id d75a77b69052e-53645f6fec2mr4914901cf.19.1792174771257;
        Fri, 16 Oct 2026 11:19:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4897:b0:533:9753:571c with SMTP id d75a77b69052e-53645f6fec2mr4914251cf.19.1792174770601;
        Fri, 16 Oct 2026 11:19:30 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb27839sm28848796d6.35.2026.10.16.11.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:19:29 -0700 (PDT)
Message-ID: <4bff10e5c6fd926f81dd65b0373ea25e6c6a3d6d.camel@redhat.com>
Subject: Re: [PATCH v2 2/2] scsi: target: iscsi: Complete an aborted WRITE
 when a new R2T would be sent
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org
Date: Fri, 16 Oct 2026 14:19:29 -0400
In-Reply-To: <sashiko-outbox-174751@kernel.org>
References: <20261016175351.126373-1-loberman@redhat.com>
	 <20261016175351.126373-3-loberman@redhat.com>
	 <sashiko-outbox-174751@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7xiDx2me0JGLBTW3vHaVPg7z8GahTDwEojpQlKXRcIs_1792174771
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-10-16 at 18:08 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> - [High] iscsi: double completion due to incomplete CMD_T_ABORTED fix
> - [Medium] iscsi: data race on cmd->outstanding_r2ts during abort
> --
>=20
> commit 538cfb5a3bbcee47d2aa78e30d5cf64fe5bed2fe
> Author: Laurence Oberman <loberman@redhat.com>
>=20
> scsi: target: iscsi: Complete an aborted WRITE when a new R2T would
> be sent
>=20
> This commit adds a check for aborted commands in the DataOut
> processing
> path when a new R2T is requested. It ensures the command is safely
> completed using iscsit_complete_aborted_cmd() to claim the
> completion.
> This prevents a race condition where a connection drop could cause a
> double-completion of the aborted command.
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
>=20
> [Severity: High]
> This patch introduces iscsit_complete_aborted_cmd() to fix a double-
> completion
> race by safely claiming the completion. However, does this still
> leave two
> other paths vulnerable to the same issue?
>=20
> If cmd->outstanding_r2ts >=3D 1, the patch explicitly leaves completion
> to
> __iscsit_check_dataout_hdr(). But __iscsit_check_dataout_hdr() uses
> target_complete_cmd() directly without claiming the completion:
>=20
> __iscsit_check_dataout_hdr() {
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
> Similarly, if the final payload for an aborted command is received in
> this
> function, it reaches DATAOUT_SEND_TO_TRANSPORT and calls
> target_execute_cmd(),
> which also queues the abort work without claiming the completion:
>=20
> iscsit_check_dataout_payload() {
> =C2=A0=C2=A0=C2=A0 ...
> =09} else if (rc =3D=3D DATAOUT_SEND_TO_TRANSPORT) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =09=09target_execute_cmd(&cmd->se_cmd);
> =09=09return 0;
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Could a connection drop in either of these windows allow
> iscsit_release_commands_from_conn() to complete the command a second
> time,
> resulting in corruption of the target_completion_wq?
>=20
>=20
> [Severity: Medium]
> Is it safe to read cmd->outstanding_r2ts without holding cmd-
> >r2t_lock here?
>=20
> If iscsit_build_r2ts_for_cmd() encounters an allocation failure, the
> target
> core queues the command to qf_work_queue. The worker thread will
> retry
> building the R2T asynchronously via transport_write_pending_qf() ->
> iscsit_build_r2ts_for_cmd(), incrementing the counter under cmd-
> >r2t_lock:
>=20
> iscsit_build_r2ts_for_cmd() {
> =C2=A0=C2=A0=C2=A0 ...
> =09=09cmd->outstanding_r2ts++;
> =09=09first_r2t =3D 0;
>=20
> =09=09if (iscsit_add_r2t_to_list(cmd, offset, xfer_len, 0,
> 0) < 0) {
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> If the command is aborted concurrently, the RX thread processing
> incoming
> DataOut PDUs will locklessly decrement the counter in
> __iscsit_check_dataout_hdr() and locklessly read it here. Could this
> concurrent non-atomic access cause lost updates, leading to a
> corrupted
> counter and a leaked command?
>=20
> > +=09=09=09=09iscsit_complete_aborted_cmd(cmd);
> > +=09=09=09return 0;
> > +=09=09}
> > +
> > =C2=A0=09=09iscsit_set_dataout_sequence_values(cmd);
> > =C2=A0=09=09conn->conn_transport->iscsit_get_dataout(conn,
> > cmd, false);
> > =C2=A0=09} else if (rc =3D=3D DATAOUT_SEND_TO_TRANSPORT) {

Both of these look like repeats or non-issues to me.

On the first: this is the same finding the review raised against patch
1
of v1, which I answered on that thread. The exposure in
__iscsit_check_dataout_hdr() and in the DATAOUT_SEND_TO_TRANSPORT path
into target_execute_cmd() is pre-existing - mainline calls
target_complete_cmd() unconditionally in
iscsit_release_commands_from_conn() today, so both are already
reachable
without this series. v2 does not widen them. I have offered to post a
separate patch routing those two sites through the claim, and that
offer
stands.

On the second: r2t_lock is indeed the lock for outstanding_r2ts, and
six
of the seven accesses in the subsystem hold it - the increment in
iscsit_build_r2ts_for_cmd(), the decrement in
iscsit_dataout_update_r2t(), and the three TMR sites. The one that does
not is the --cmd->outstanding_r2ts in __iscsit_check_dataout_hdr(),
which
is pre-existing and is the only unlocked read-modify-write of the
field.

The line this patch adds is a read, not an RMW, so it cannot contribute
to the lost update described. A stale read is also harmless here: if it
reads low, iscsit_complete_aborted_cmd() takes the claim and the later
completion in __iscsit_check_dataout_hdr() becomes a no-op; if it reads
high, the completion is left to that path or to connection teardown.
Exactly one completion happens either way, which is what the claim is
for.

Taking r2t_lock for the read would not help and cannot be done as
written: iscsit_complete_aborted_cmd() calls
iscsit_stop_dataout_timer(),
which sleeps in timer_delete_sync(), so the lock would have to be
dropped
before the completion and the value could change in that gap
regardless.

The inconsistent locking on that pre-existing decrement is a fair
observation and I will fold it into the follow-up patch for the two
unclaimed sites.

Given how much testing went into this set of two patches, 300 attempts
and was stable I am inclined to just make the v2 change and that's it.

Thanks
Laurence

