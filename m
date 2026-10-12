Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFF296BBC
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782260; cv=pass; b=O3OM1QDh9GnRCGqRy23C/Efv4utV1LueMxjjIfTpSilxuJ3zh67CUWZ694cHx94aRVVzdZ8OQht7WjkXxgkfV8D0sxvoPxFL6x6IxdW+ORJZWTmMhSKlkOk35YSSiMaqTt6pKn9paOCEdodfca8gxamQ/Daf/cgMA2RT18pbzAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782260; c=relaxed/simple;
	bh=eR+fmL22lupP1pDQ/Am7C6byc7i0RQGsHO+PHaoUMS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQt6+HAz8ctdKSNpzS5BcU6k30eYsoLx87+3kGOA80HbKFxJ4OxJ833GogBV43ialqP3DbBASRgWdOyTon2pWxl3EfOzsG6PhFq5AuYZujUcTiol3+K6ayw342PWvKAI1a3kk/9jZHUBvF4ZDSx9RseWsj/bM+89KHZ1FJ1bRJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMBCb5YQ; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMBCb5YQ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93c5b7f5bfaso720413885a.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 22:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791782258; cv=none;
        d=google.com; s=arc-20260327;
        b=qVKROZoQSfBpon/fvE7lXv+pOeS/SRhAwabFfaSOWkSvmaD4JE5MkRO4z5i+DQqIg5
         5p5OFwJY3GM1kekBbZcxcxgwVYr215yJv6lqofnLmgCq4XRz4XSp6/+Ig6DPsVGiFVhf
         Afomffbg+lfJZDYb6rvMl5ilhgcP3HeT+gwoqZgkFTmWY1G+iWzcu876uwWN8qHXnI4u
         XnhQ2bcCQ3i5S6AltRNHmAZpRpPMDD5MjwMs6p6/5kXIS5dlfSHXjWJc98s+J+nwdcDq
         WEqgxxptBAAItu/n+0kja+XLVav6zfiop9CTQmW/UBO9fQ3jbW0uLAxS6XYg1luXRxH3
         G9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fgfFsidpQQCyeZD6VQBMcPL9jH+HS8umBdgVKZVkXdA=;
        fh=HrRLF2UV/6Wehm0QGnmf0WSyoTrnzAu/4xRsd50CIds=;
        b=M1yK5fPiXWbSNZib2tq671wUMe2n9zCHRlBJr1JQocniZy/lq3bDEarhvRhMwPxwun
         R3Q3hP8C1zhc0n2v7SPBXcWGrLW8Tkz+6DhBWSGVmi7hcJw5+eiTNym96gXA7WnXipAP
         yWc4BmbguPcPzld51l21AMVzIxcyi6T6aMgRaxcmSH8UQw74qNEB+oVTO3NfdX/IGuZK
         fH4tryTYDFbboqo2mlYh6XmKPWL7L0Kwoi0cnHXKEA4uzmZrI7TBWf2QpiKIlXfvrcRt
         uIAURgqR+L70VYPJeUp82oAHRSmJBNe4De/aGLfBDOKc2Ya3WRNLW9mOPHy7s9iNPTyP
         9hzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791782258; x=1792387058; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fgfFsidpQQCyeZD6VQBMcPL9jH+HS8umBdgVKZVkXdA=;
        b=JMBCb5YQ3WBdl/nIM0E8HjsJmhxHtVEzlZwhjiJ/YmrtLII+zX6Wl43B0FNEJhtF9a
         QqUev1HQTdZaa0sFEvcMsqIg8G9Gi1ZHGkoo1kI4OYRjq4ivEO/D/lHRy5RhbhAbxiWp
         mhMUUZeZ7R6cDr2zoQ2XkPJQg+WQ9j3/43FWq2NLUP4r0aOtLrYI5+5yNWAiMGfTVYhe
         YNSgTzVB0tvyjgdcd8/8TnhL2Dz8SSYJ8uvj0rBwQqvCe1DqSTVPTY69/iNV6HXw1M7b
         i1WT1i2VeSpRzIl2Ekm80HunHYAcaxU9HZb3/B5C+asbLVW0jRY9rHczeaoGg+5+y6Vf
         P+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782258; x=1792387058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgfFsidpQQCyeZD6VQBMcPL9jH+HS8umBdgVKZVkXdA=;
        b=MnWnKXRoH2c7mnhTkzyhYARZEtMFMtcbzWMuJnysbDYTGstT2xA0TETmWWYeZhApWI
         Y5oCNaTDxPTDmVAK1SNtHbsp18PQcwn3I4ZA6UwkUU6/98UZ/jTa7AUK5t8IbGc38E0L
         ZjahbjYt0md8mbeDw8rP+PA+u1H467KnYPwPxhGZ4MvxErA//JSHCeS+fjIBCJJZx9h0
         qr8BBvhwEYdBAMAD1nMAYbP0dG1cQylb/Z/GJRdfqXKo2CGTS6SdzItKYpPqwXtH9WPI
         bAOGGKOCUv1oL7JcOSU6oEg5Dj5glfn0/dAJBJvO1QRnVWkdayNTvJHxTCdLNCLjoSbI
         Oh/w==
X-Gm-Message-State: AFq9FYJxErTc4dPvkc1SUIHgknxWWfakppVcBdumpiYYITJX1LU8t4fn
	CTsRffHjYQXbdFJwuNvhRjVEPO92FDwOhw5dBWR4W2okFZDy3IApylVe5B90RbVuj9kY8DAZyh6
	MJ94j5UssC2dhhPKnWYpbksmP4dttEfusDlcN
X-Gm-Gg: AYBFou05Qn2KWKgpaevyyrwMHM0oBuWWYeBaCpocBmX2RZzMXI+1OBOgWhaDW41IB1B
	kPwxcOx2lu0FaynrNE1d4hx8MQKJ5+zIwR77Luo98cIUmbbaHZj9OT48ltM9d6BDwRlmZp5pIMi
	00DQ/U0MS4wjFzfZ4JzN5rJO4oVwN3rB8mY7zphfIxmT/mddAShkaZ8vI8k/tpP2wc3BIHJGuoe
	/XVoPkqLWISrQVaXX/qLFPWK/eT3lIs4k5hb3b/ylxVajKHa78B9Z5SnQH9Au9HQgl8NvBHM3in
	JgL3v1SFJoLY9qoNzqkEUKs9kJxYC6c1uxodXb/UYNp0NKbUo4XdrDxxVh5V3bpvRQI=
X-Received: by 2002:a05:620a:468d:b0:93e:c173:f694 with SMTP id
 af79cd13be357-93ec173f895mr1213489685a.40.1791782257577; Sun, 11 Oct 2026
 22:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011014803.100454-1-physicalmtea@gmail.com> <sashiko-outbox-167544@kernel.org>
In-Reply-To: <sashiko-outbox-167544@kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Mon, 12 Oct 2026 13:17:00 +0800
X-Gm-Features: AclHuK-lnMJpW1Hk4QztCSGXZUH1H-mtHMg6D6LOi_sK5vUMHTywqi2KmYQFORE
Message-ID: <CAJwVaMK8MOfKjhWHH_MA3WqxxraQkQyeeN1RqUoANxZSnDJ2Dg@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-scsi: do not count PI bytes in the data length
To: sashiko-reviews@lists.linux.dev
Cc: Eugenio Perez <eperezma@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] vhost-scsi: missing validation of prot_bytes alignment allow=
s OOB access
> --
>
> commit a2683cd412935b122ac2e93ce16af9655a892639
> Author: Jia Jia <physicalmtea@gmail.com>
>
> vhost-scsi: do not count PI bytes in the data length
>
> This commit updates the expected data length passed to the target core
> by omitting the protection information (PI) bytes. It adjusts the length
> so that protected read and write operations take their length directly
> from the CDB, preventing issues when the data scatterlist is smaller
> than the total length.
>
> > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > index 885fac5ed042e..8b32caa7ec294 100644
> > --- a/drivers/vhost/scsi.c
> > +++ b/drivers/vhost/scsi.c
> > @@ -1534,9 +1534,13 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, stru=
ct vhost_virtqueue *vq)
> >                * vhost_scsi_queue_data_in() and vhost_scsi_queue_status=
()
> >                */
> >               cmd->tvc_vq_desc =3D vc.head;
> > +             /*
> > +              * exp_data_len is the data sgl. prot_bytes already sit i=
n
> > +              * the protection sgl. Protected READ and WRITE replace
> > +              * data_length from the CDB in sbc_check_prot().
> > +              */
> >               vhost_scsi_target_queue_cmd(nexus, cmd, cdb, lun, task_at=
tr,
> > -                                         data_direction,
> > -                                         exp_data_len + prot_bytes);
> > +                                         data_direction, exp_data_len)=
;
>
> [Severity: Critical]
> Does this code allow an out-of-bounds access when prot_bytes is not align=
ed?
>
> In vhost_scsi_handle_vq(), prot_bytes is extracted from the virtqueue ele=
ment:
>
>     prot_bytes =3D vhost32_to_cpu(vq, v_req_pi.pi_bytesin);
>
> There doesn't appear to be validation ensuring it is a multiple of the 8-=
byte
> T10 PI tuple size before it dictates the length of the protection scatter=
list.
>
> When the target core later processes this command, functions like
> sbc_dif_generate() in drivers/target/target_core_sbc.c loop over the
> scatterlist length using 8-byte increments:
>
>     for (j =3D 0; j < psg->length; j +=3D sizeof(*sdt)) {
>
> If psg->length is not a multiple of 8, does the last iteration read or wr=
ite
> past the end of the mapped scatterlist element? A malicious guest could p=
rovide
> an unaligned pi_bytesin or pi_bytesout length, potentially causing an
> out-of-bounds access into an adjacent physical page on the host.
>

This issue is not introduced by the current patch. I have previously
sent related patches to fix similar issues. I personally believe that
this kind of issue should not be fixed in the transport layer.

https://lore.kernel.org/all/20261006093338.27342-5-physicalmtea@gmail.com/
https://lore.kernel.org/all/20261006093338.27342-6-physicalmtea@gmail.com/
https://lore.kernel.org/all/20261006093338.27342-7-physicalmtea@gmail.com/

> >               ret =3D 0;
> >  err:
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011014803.10=
0454-1-physicalmtea@gmail.com?part=3D1
