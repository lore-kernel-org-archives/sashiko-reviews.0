Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF552121F
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 15:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572590; cv=none; b=WqSnoxkWAzReklebm5i2GmqFU5ejkVtSDpOgyd2MVkJl24TeCIXbPKQDx3DmqqwZ/zeWOzzJ5k+pjgYco+apm7LXEs+J3N5gQyiPKmGKWK05OYN8SaNHNJ3I3J4wj7BGQaNCrI/YjMZSghgkFQDLENOgMzDBuxsMXXce9hsLfic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572590; c=relaxed/simple;
	bh=ur8jGZBodHZSavUPypSxikkpNnELggvCR1Zu3bdWqZc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plt7UqyCSoIRXyE+6xgaOaU+LS0jIvReTmjpGeypKQd/McP81M5uqTftEtLQo0KWrXCMrm016h/7WcY2zozLNldmIczOAzCMKyJ41rWeMgLJJIEsiaOtNZjLqE/ibvxRqh8zvpJPdpJDUsXyulApsPnlGuItzGMgCZQlOP/3Mzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cFYJxe4S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cFYJxe4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789572584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zksKoJl6eUKjrPvlbF74E3zGu/R14HHohaTUkqR0U8I=;
	b=cFYJxe4SM6nt4Zolt4I+FKVh97DWXBO9AIyzSekQXIy2/9YJ1YoVXYHv/FIc3g0ArkCvv1
	uVan6oJ9GwUOlbfzDSc8qcuDAY8fYBao81ssQkLbvy3xlI1bjR1k8QUpp3KB2jK+ADFlCK
	E49mKjvJDPfw26NUYRtlhJ5RrFdWiL8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-2xVyxP5dNvK-P12DWajEug-1; Wed, 16 Sep 2026 11:29:42 -0400
X-MC-Unique: 2xVyxP5dNvK-P12DWajEug-1
X-Mimecast-MFC-AGG-ID: 2xVyxP5dNvK-P12DWajEug_1789572582
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so529781085a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572582; x=1790177382;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16Klj/8b45VwOWfkXP9CkYxD9spB2q1cvTb2rAE2bR0=;
        b=xJG3ArOUZabESfNZW9jIxXR5uclWhgwAcDnlgAMjl9DbUC58ppqsSQIJnJ8Xx/cgfp
         vanXT+7JQ+gN/pjWM3TMoGtwRuEPLTHRBRYRJ5OAHFBRuwVixrZhEDc7ytXX/pgwEGcQ
         RePDnOFYkNw2FXvyse9CMPX5xVS2FfQ1uCurjdKRALrQquIKLi6f1mohQHAj+T/J9Gk+
         q6E+7JYCvTKB41uYxumcyd0xJgLRF19gUMr1qJz3NV/aRTk8zSwsmCUMQJmIrDVoiL7w
         GUhhyzMofZfCdeoSLdTFZDp8XRU9KcKFcECK1/kv+L4ozheaw4c4TnLjVVe49hCq4a8a
         3OPA==
X-Gm-Message-State: AFuF++lw5Ad38LXG+6OrS9P2jdnrEMRERZbsLbyFLt9zkuunyD9H+Spi
	2kEMtGJ+DAnQrL9WIQjCEEkUQuhSVCSBkedFKVHvP5dXBFA6JIob8GE1ubYO+rfG56LACqZEE+4
	hTdJ880KdyGvRjjTAWaPnHQHzsfiGvXaeJtWXQVRO5FkswM1nVXT+pmQpj2ooOzKn2qUk6Fb834
	lPX5JBodnVs3uVfpxANWZ92ASIRdMqEgqNdgVSYVSAhAVRfKitAlI69w==
X-Gm-Gg: AYBFou1zMVAU0LNFczjbF0qbW3pkcqC4YP/B/K2LKhotygwpBy2oLm0drhWSdW437lS
	xvFJSIBZgG4r8gZzUFnYodVk6m+f4+RuBFUaNJ7FbDRUEUhgc3wLN/2A7tw2QsvuIfj2/Wqgu4n
	DA2Kgro3kI3iyCt2Ojx/670b/IGO+lQctJ+/EyQWqTqBiX91Jys1SkbeRkWtEN3FGWJEZP0tZ3l
	/6xE19j3s6ObpHOrpdrAx2v5wjtmTei1qYor3ikgnj9dJ65iMvqLa1JvWE66AV4qA8MMextvw4I
	id1mW6KTZdy0DS8P9xTJhWVnpVz0lQ+8++hGgafmOCPc9+K/7uRZNmWHy7ytKaS/BNjv6HhR8hw
	dawbvlo5XywhlYP2e3ol6ZNW4eQ+LjVzpsQ7u
X-Received: by 2002:a05:620a:2548:b0:93a:273:6a41 with SMTP id af79cd13be357-93bb791b543mr474188285a.29.1789572580749;
        Wed, 16 Sep 2026 08:29:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:93a:273:6a41 with SMTP id af79cd13be357-93bb791b543mr474129085a.29.1789572576026;
        Wed, 16 Sep 2026 08:29:36 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:dbb1:97f1:a6e6:766b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d18e5asm246235785a.44.2026.09.16.08.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:29:35 -0700 (PDT)
Message-ID: <2ff511fa29b801ab74ce9ee60e1257c47918c1db.camel@redhat.com>
Subject: Re: [PATCH 12/37] scsi: st: use 16-bits defined sense codes
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org, cassel@kernel.org
Date: Wed, 16 Sep 2026 11:29:34 -0400
In-Reply-To: <20260831021927.90FD21F00A3D@smtp.kernel.org>
References: <20260831020451.585944-1-dlemoal@kernel.org>
	 <20260831020451.585944-13-dlemoal@kernel.org>
	 <20260831021927.90FD21F00A3D@smtp.kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gjr5RYhqDuqqafZ1MU9KMRPRNpCqQQAViwobVgm4_5I_1789572582
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-08-31 at 02:19 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] Incorrectly assigning ASC value to ASCQ in SCSI
> tracepoint.
> --
>=20
> commit c1f7c0aa9501c3562bd45de8a85431d940fa338b
> Author: Damien Le Moal <dlemoal@kernel.org>
> Subject: scsi: st: use 16-bits defined sense codes
>=20
> This commit refactors the SCSI tape driver to use the 16-bit
> sense_code
> field of struct scsi_sense_hdr. It replaces hard-coded additional
> sense
> codes and qualifiers with enum values defined in
> include/scsi/scsi_sense.h
> to improve code clarity.
>=20
> While reviewing this patch series, I noticed an issue introduced in
> the
> related change to include/trace/events/scsi.h:
>=20
> > diff --git a/include/trace/events/scsi.h
> > b/include/trace/events/scsi.h
> > --- a/include/trace/events/scsi.h
> > +++ b/include/trace/events/scsi.h
> > @@ -303,8 +303,8 @@
> > DECLARE_EVENT_CLASS(scsi_cmd_done_timeout_template,
> > =C2=A0=09=09if (cmd->sense_buffer && SCSI_SENSE_VALID(cmd) &&
> > =C2=A0=09=09=C2=A0=C2=A0=C2=A0 scsi_command_normalize_sense(cmd, &sshdr=
)) {
> > =C2=A0=09=09=09__entry->sense_key =3D sshdr.sense_key;
> > -=09=09=09__entry->asc =3D sshdr.asc;
> > -=09=09=09__entry->ascq =3D sshdr.ascq;
> > +=09=09=09__entry->asc =3D scsi_sense_asc(&sshdr);
> > +=09=09=09__entry->ascq =3D scsi_sense_asc(&sshdr); <-
> > --- here
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^^^^^^^^^^^^^^
>=20
> [Severity: Medium]
> Is there a typo in this assignment?
>=20
> In the scsi_cmd_done_timeout_template tracepoint, __entry->ascq is
> being
> assigned scsi_sense_asc(&sshdr) instead of the ASCQ value. This
> appears to
> log the Additional Sense Code for both the asc and ascq fields, which
> will
> result in lost diagnostic data when userspace tools analyze SCSI
> errors via
> tracepoints.
>=20
> Should this use scsi_sense_ascq(&sshdr) for the ascq field instead?

Hello Damien
This seems to be real issue here that sashiko found

We assign the same for=C2=A0__entry->ascq  as we do for __entry->asc i.e.
scsi_sense_asc(&sshdr)

We need to have it as

+=09=09=09__entry->asc =3D scsi_sense_asc(&sshdr);
+=09=09=09__entry->ascq =3D scsi_sense_ascq(&sshdr); <--

Otherwise we will miss the ASCQ

Thanks
Laurence



