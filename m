Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475933A9605
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 18:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705788; cv=none; b=sdEPdWssk6Azas1RiaSyWCfaTAOg5tA29TPGcMcttu5UFDmrUoPyZgz6A7FK6TejWlIyeFfeunrmeFXFbzV3z+LBxzj3cVY5atJHbwRRPbrNCBkAcdCnb912rS69lIZ9NfkKhAE/MpL6NxkI095AvcnzNtZbpnSm3hMl8kKxdvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705788; c=relaxed/simple;
	bh=/xQSZh6TAodTLO5mzjWuNf5C/Nmzz8Dl2ftrTa5C2+A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=owntEha/Ny71gkil7YhhwZppauhnrD7uVplkReKG4lbYP/cIfuf0kLgUiwHWrMLPd1FfdcLG3T2jpk7jdvQezOSYA1TMzsTzrJC2poVGdVMCPXIykBoex4p5IJL6vXSdqCfEtIvA1jsuRC5UmPWaPcgXaYwkUxOodxn6ljdnuKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5TrpPBi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5TrpPBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790705786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xQSZh6TAodTLO5mzjWuNf5C/Nmzz8Dl2ftrTa5C2+A=;
	b=U5TrpPBin7hwr6gq0d4bJROpGgsO9xkcWW79x8g/nPP1ux9lWiAvFPoQ1DvtkuzBS+Xi3D
	mioJpXqA8vGhE0t5iWee0utb2ZJnzUP7z2ZBFLg+oBIq8TmcrHZbpd4QMlX8UbEd8uhp3c
	2pPpxeLRQRpAFenh6LX7tXOEUUB9nTs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-HS8ZStK0OEOMf8RG-bJs3Q-1; Tue, 29 Sep 2026 14:16:24 -0400
X-MC-Unique: HS8ZStK0OEOMf8RG-bJs3Q-1
X-Mimecast-MFC-AGG-ID: HS8ZStK0OEOMf8RG-bJs3Q_1790705784
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91784ee94b0so12871616d6.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 11:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790705784; x=1791310584;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1luB7NLM4bPb8otE9nxg2bzJ3BE46DMUdvlMv2Kr3M=;
        b=XGNGFyEuWfo767tckn9b9pJbwfrJbUPqFsUBJKStWeTOor4mYjz06f1ubmZn4d+xOp
         PxIQqWNKOi2a+m7D0PMo7/07CNMpFx9PVB43FD8Val+siqyKKbi7V//oRgvBGTBcP+y+
         GThIl0VL2Cb8lp81EshOwtq03b3Wa6/z+VxEYfiTd9ljxubJZBCB8NnMpHu7NAN5Quoq
         WW5mbUMi5GAh49LegY3H7spWHMT4sTgd8xZF+INS6f6/0UQTwTWJ6bgZa1vFIMAzp977
         /fzAUGVdlnOo4npp1QQbQviDgkjscjfUcp9xKrh+Nh/yv/C03gNtRZdC6O12zkWVbYub
         x2gQ==
X-Gm-Message-State: AFq9FYLdFC+zUHeqhX/tPygjjS2ucBsZww+DpmXMHZ9nKoWl+ao+7g4C
	1DRu79Ts5ExFOWJNqGQq5o9m+nINzMeczLoVmJfUVcE3NIpDarWjDtJjRt8Ok1zveHqmtQxrstN
	hw/ayNLhFAZIgoOUvIjH4n9H3RtV+FXGzK58N88LgNE2ExhxCliriza2rcmyoRnZbYqcJrszpdM
	1TlvoFFzEoFb/x2FXu22uNibZ1W5qtIU1SWAYSj15anujA6mVZEnHdoA==
X-Gm-Gg: AYBFou3gBAKipig/SOpluYFjw2BwB8i3FpjBokNRSrXwngwWvafqxykV86QvlIRGg4N
	tAJVd74uyU68JF2SDIGLnO0W+rVK88thw3qkthxE3Ki3zODpGi+c9bUsjKrLcOpqpfkNf6Oz20w
	AZFfHKnLEmpiuiOFKIpUr92oiUKH5Rjqo38HNsh1ZdHZO6vMqn9OTDGJhWsT1Z+YNyspRD0bc0K
	H8oOD+yzf/ZoQYpS715G2/gn7G3y8ZbhPIZXvdLJs5uh0o3ZA4nBU8094/h6tWYxyopI2vpG1Fp
	0SNtHKZkAj1VtC6eQFIO3T35mBS2OwcB//6CVVv8us4X1ffrOGIFVYe8jNbef9Ud4Fq/RiLs+TF
	dQW4cUyvu9/96qwtwj3GRlTpJ+BwQhV1LmmE0
X-Received: by 2002:a05:6214:486:b0:915:e9f2:8e5c with SMTP id 6a1803df08f44-9178265bcbfmr79144566d6.33.1790705783831;
        Tue, 29 Sep 2026 11:16:23 -0700 (PDT)
X-Received: by 2002:a05:6214:486:b0:915:e9f2:8e5c with SMTP id 6a1803df08f44-9178265bcbfmr79143996d6.33.1790705783146;
        Tue, 29 Sep 2026 11:16:23 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917987a0ef3sm1424346d6.13.2026.09.29.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:16:22 -0700 (PDT)
Message-ID: <1a3b5b8507179a68c9db951d715d7c5622611ff1.camel@redhat.com>
Subject: Re: [PATCH v3 2/4] scsi: st: Record the tape position after a
 successful MTLOAD
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Date: Tue, 29 Sep 2026 14:16:21 -0400
In-Reply-To: <20260929174142.172051F000FF@smtp.kernel.org>
References: <20260929171813.844733-1-loberman@redhat.com>
	 <20260929171813.844733-3-loberman@redhat.com>
	 <20260929174142.172051F000FF@smtp.kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9PCFFh_9eNTKRucWR_8f49vY8NyIArwB6R242ClJq6M_1790705784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-09-29 at 17:41 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] scsi: st: data corruption via rogue filemarks after MTLOAD
> --
>=20
> commit fa623b9485fe23a48925ee926b259a954fdd216e
> Author: Laurence Oberman <loberman@redhat.com>
>=20
> scsi: st: Record the tape position after a successful MTLOAD
>=20
> This commit records the tape partition, position, and EOF state after
> a
> successful MTLOAD, similar to how check_tape() does for a new
> session.
> This fixes an issue where the driver would incorrectly report
> file/block
> as -1 because drives didn't report a new-medium unit attention when
> already loaded.
>=20
> > diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
> > index 0a4263bef9cbb..e5b2e2d4872d3 100644
> > --- a/drivers/scsi/st.c
> > +++ b/drivers/scsi/st.c
> > @@ -2686,6 +2686,22 @@ static int do_load_unload(struct scsi_tape
> > *STp, struct file *filp, int load_cod
> > =C2=A0=09=09else {
> > =C2=A0=09=09=09STp->rew_at_close =3D STp->autorew_dev;
> > =C2=A0=09=09=09retval =3D check_tape(STp, filp);
> > +=09=09=09/*
> > +=09=09=09 * LOAD leaves the medium at the beginning
> > of partition
> > +=09=09=09 * 0.=C2=A0 check_tape() records that only for
> > a new session;
> > +=09=09=09 * without a new-medium unit attention
> > (the medium was
> > +=09=09=09 * already loaded) the partition, position
> > and EOF state
> > +=09=09=09 * would be left as before the load.=C2=A0 Set
> > them as a new
> > +=09=09=09 * session and MTREW do.
> > +=09=09=09 */
> > +=09=09=09if (retval =3D=3D CHKRES_READY) {
> > +=09=09=09=09STp->partition =3D STp-
> > >new_partition =3D 0;
> > +=09=09=09=09STps =3D &(STp->ps[0]);
> > +=09=09=09=09STps->drv_file =3D STps->drv_block =3D
> > 0;
> > +=09=09=09=09STps->eof =3D ST_NOEOF;
> > +=09=09=09=09STps->at_sm =3D 0;
> > +=09=09=09=09STps->last_block_valid =3D 0;
>=20
> [Severity: High]
> Does this code risk data corruption by omitting a reset of the rw
> state?
>=20
> If a user writes data to partition 0 (setting ps[0].rw =3D ST_WRITING),
> issues
> MTSETPART 1, and then switches to partition 1, ps[0].rw remains
> ST_WRITING.
>=20
> If the user then issues MTLOAD, the ioctl clears the rw state for the
> current
> partition (ps[1]), but do_load_unload() then forces STp->partition =3D
> 0 without
> clearing ps[0].rw.
>=20
> Upon closing the device, st_flush() would see ps[0].rw =3D=3D ST_WRITING
> and
> unconditionally execute WRITE_FILEMARKS at the beginning of the tape
> (BOT),
> overwriting and destroying previously recorded data.
>=20
> Should STps->rw =3D ST_IDLE; be added to this block to prevent rogue
> filemark
> writes at BOT?
>=20
> > +=09=09=09}
> > =C2=A0=09=09=09if (retval > 0)
> > =C2=A0=09=09=09=09retval =3D 0;
> > =C2=A0=09=09}


Thanks, this will need to be fixed.

Correct, thanks. After MTSETPART, the previous partition's rw state is
not reset, and with v3 st moves to partition 0 after the load, so a
stale ST_WRITING there makes st_flush() write a filemark at BOT. v4
will reset the state of all partitions after the load, as check_tape()
does for a new session.=20

Please wait for V4 to fix both Sashiko reviews

