Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599CC379C5C
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860403; cv=pass; b=NyHHjouiTgKuVA7ProNzRXsGfsWgk9oh42JEMF7lEp8zU3UKMkGS4VfBV5CZl/3/TuxrbZ3qWWC1gOBnJTAd0HrLHjQAACBQ+d9nzTV7Jk+2cUUM115vHUdMGoJKsP+rmBFF+RuhCNGTnoQjCykacgB75z+72O1M4y5dw2x2UH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860403; c=relaxed/simple;
	bh=gVjMhbAwFcmGN4yhqQ+ojB2Np3m6fVMAekUHo9EEer0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ur+EgxLE7AmzB31hMg2G+JpqVtV4LgrADs6SxbRJNluwqhy44zXQvoxg45jMJhgNhu2WeURNP0Yivcv6GLQV65F/0zec6FCEdWy7tuLZucti2B6jFTtWE01l/0Kvy/lZMMwtXiYeYWX8wdH1ASfmQW04UITYfNl52M2xp4/aNfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WNKblqCk; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WNKblqCk"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-451fe9bf738so21054fac.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 12:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787860396; cv=none;
        d=google.com; s=arc-20260327;
        b=MnCShI0Agy+ucjtstMgmIbu8wex/HFXSafmYBQY+0RR4+H2Y3AMFGpS5MRYKGEHQ9O
         bjxKgFi7vBopbz8zV27nJV2fRE+WxsCfiTwnR8LV1HnYHCJ8zqLaSFOma6cTJWP+QLZZ
         BezizEfPRPHn1fFUBbELxaqJWiaR1A2cWsVDt7DBaC4lpeC9oILEDgE1FIvXF0Y0dqxL
         Ae9BFYBht4kkgxI60HvI+oi/HrZaSIP+WpgYtI+PnW9wpXHT9DOfY9L6fn32k0g+vSdL
         28cUdxFqsmXhgY6b/NMw5RiN3Vo/GPOulhUin2sV1zVxP9+XLysr0niBn057F08heIL6
         1J7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h/okYFTS2lL08kFzVd4eJiLNff++PKarqdGjVYshS7E=;
        fh=0YJFAXSAxtPwBJuwobsx4jc1q1FYv+nF6TKm25g0B/o=;
        b=h5mEnQSh3iWxtAs9xokW7Hs8VrkPhzm4RQ8V9NvmZvwNSiY9OVXFjgIt6YTpva8U9H
         0IAZWsB+Z6C6pgtvEy/zeXRoM6+HovOPS+clyq/RGHeCUpk165zvg3QX9VmdiNNoLQws
         HeVoi26OWbnlpw1GaIIKf74iwfr5PiGoEQJnAdDdtOR88Fk9/pSbPsjJlFWI7M8Obtz+
         XLzR5EmLYzCx2jBiRn+mWdIdKqYjEalf/P5eH20AjkKPyon+nbnJnz/Hir7vuy60zZ2W
         H2KiwYgWk50WGL/QNVcZFSc434kHzj0LspBebVlL5Z0wI91c6JqA/ZLwepAMAZ6l9WIl
         Sh/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1787860396; x=1788465196; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/okYFTS2lL08kFzVd4eJiLNff++PKarqdGjVYshS7E=;
        b=WNKblqCkFC1515LdQeVTYM+9f8nd3ZK5mVZYhja+/3VxG+CDIlLyiBDsbYOVc/90Ho
         a4iTApvdSbbo25ylCtodudyd8R5j80Qx7kAWLNeLuAkAVnfIMx2R2pL+dP3Ja3LlDeV6
         mdw6yuyOlaDoU0suUk6jQ5V3yV26FpPRuaS7LTlbE02hu+RxELn3BKIwbQMltSianDhd
         p8YmVvtTuUwyny1cgNfAvu2hDn+2BjXQS61F6nN6sz0PQ9gCM6SZLLnzbH/FMxelUuol
         cFeAY50LHPYN7q1rniftqplpLRFFtYnz+jWMXaBNRvUfMboorMI48JhiVNpr3K3HRqHq
         vw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787860396; x=1788465196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/okYFTS2lL08kFzVd4eJiLNff++PKarqdGjVYshS7E=;
        b=FLwo/nHDENqZKOP7QJjSOYTZ1SrGcFFZ5zmzCRzJ37OMtwoAQTd4AqTSuJix+9x37G
         y2+lJyA57iTnOQMWrvtSpcl2tqU6jBqgJheUbblZxYn9qvdImnh5HiFePTOU/sw3Y95x
         7Y9dnWREW0LvfEJ+usbK/ho5cBGvViLu1kqDXCml3yZ26Z1ZFKcLLtAt/YigGw4bIbow
         x/xXL/quD0+dLpFDmY21Y96r9rohUc8WKteFKQeoZMdF4i80vSL9wn+2gfLbPN/HXczO
         GpRwgVBb/UqgzycyK9zZivMf4JPDayiObCm9s2W/FDI002hIAzMfu5KWTIzWpzX1oe2O
         51PA==
X-Gm-Message-State: AFuF++mZaaBCaho7XI9YOXZiOqb6R64Bd1OyDd96bf4Jv2RJ+HUgTyh3
	97xmaBLId59uuw/jWuaL3GojsMhVj9kf99Bl4iyj3p4fGQZiVizLKxK65rtMLDXZ+RAHF8aEta5
	hYWJXIJW9Q1aHfc6MeZwhwHVKkocLzWIDq5pOVceLR56i5KzEXnWMgKQnEA==
X-Gm-Gg: AR+sD12XT5FR78H+RH61dw+9+ubPDnZu+V1DEM6OUJmjBKSHlVUhHeA8/aI0VEWtgrN
	a1HDJmZLXXcK1MSA7ybCl5VPCi7ikUYsi0+1j3N+HEcLqHf3tEyZVnIjlLP+ko1Aqlhlu2y9meA
	nqKFun0YuN1SXzdoydSzz4NbmZgfIFHF91MX5Fq2OPIxgpbh1iJqEPBOeOWqD9dzu4Ed8W6QBaO
	PARWi9Nao25/pX45Pbv0x24AmuyEYVs9lw+KlqMtA53T/fRA/Snsw0NpIJGMplJAZ/H0lMM58Pf
	PK5HDuRvNq6NsCYdOsi9g/GIDgxbjJyzlLFTfxdJS/kZ
X-Received: by 2002:a05:6871:4183:b0:45f:32fe:3223 with SMTP id
 586e51a60fabf-4683778aef5mr1163905fac.4.1787860395608; Thu, 27 Aug 2026
 12:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com>
 <20260827185722.3234622-3-csander@purestorage.com> <20260827191705.D53C91F000E9@smtp.kernel.org>
In-Reply-To: <20260827191705.D53C91F000E9@smtp.kernel.org>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 27 Aug 2026 12:53:04 -0700
X-Gm-Features: AcwNN1W4YwDKJsJ4I9wWFXfEnGuBCnFCExgwaK_ALpgcocy3M7K8ifopiYrTRDc
Message-ID: <CADUfDZoJj6_wHv7_hpCOGRfAEGfb7J=5PJJ+++VrLqH-MZvNfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()
To: sashiko-reviews@lists.linux.dev
Cc: dsterba@suse.cz, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Polled NVMe uring_cmd requests completing via IRQ cause a Us=
e-After-Free in nvme_ns_chr_uring_cmd_iopoll.
> - [Critical] io_do_iopoll unconditionally overwrites req->cqe.flags, dest=
roying IORING_CQE_F_32 for polled uring_cmd requests.
> --
>
> commit 67604b5180877187b81d959a1a1acc3b5bc52ca4
> Author: Caleb Sander Mateos <csander@purestorage.com>
>
> nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()
>
> This commit moves io_uring_cmd_set_res32() from the task work callback
> into the end_io handler for nvme uring commands. This eliminates the need
> to store the result and status in the PDU, saving memory and unifying
> the completion path.
>
> > diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
> > index 269afd5bc02e3..8d357c47111f8 100644
> > --- a/drivers/nvme/host/ioctl.c
> > +++ b/drivers/nvme/host/ioctl.c
>
> [ ... ]
>
> > @@ -414,15 +411,17 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(s=
truct request *req,
> >  {
> >       struct io_uring_cmd *ioucmd =3D req->end_io_data;
> >       struct nvme_uring_cmd_pdu *pdu =3D nvme_uring_cmd_pdu(ioucmd);
> > +     u64 result =3D le64_to_cpu(nvme_req(req)->result.u64);
> > +     int status;
> >
> >       if (nvme_req(req)->flags & NVME_REQ_CANCELLED) {
> > -             pdu->status =3D -EINTR;
> > +             status =3D -EINTR;
> >       } else {
> > -             pdu->status =3D nvme_req(req)->status;
> > -             if (!pdu->status)
> > -                     pdu->status =3D blk_status_to_errno(err);
> > +             status =3D nvme_req(req)->status;
> > +             if (!status)
> > +                     status =3D blk_status_to_errno(err);
> >       }
> > -     pdu->result =3D le64_to_cpu(nvme_req(req)->result.u64);
> > +     io_uring_cmd_set_res32(ioucmd, status, result);
>
> [Severity: Critical]
> This is a pre-existing issue, but does moving this call before polling ex=
pose
> a regression with IORING_CQE_F_32?
>
> When io_uring_cmd_set_res32() posts 32-byte CQE results, it sets:
>     req->cqe.flags |=3D IORING_CQE_F_32;
>
> However, for polled requests, io_do_iopoll() later executes:
>     req->cqe.flags =3D io_put_kbuf(req, max(req->cqe.res, 0), NULL);
>
> This unconditional assignment completely overwrites the flags, erasing
> IORING_CQE_F_32. As a result, when io_fill_cqe_req() processes the
> completion, it allocates a 16-byte slot instead of 32 bytes and silently
> drops extra1 and extra2 (the NVMe-specific result values).

Yes, this does look like an existing issue. Perhaps the req->cqe.flags
=3D io_put_kbuf(...) should be using |=3D instead? That would match how
io_req_rw_complete() uses it.
>
> >
> >       /*
> >        * For IOPOLL, check if this completion is happening in the conte=
xt
> > @@ -435,7 +434,6 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(str=
uct request *req,
> >           iob->poll_ctx =3D=3D io_uring_cmd_ctx_handle(ioucmd)) {
> >               if (pdu->bio)
> >                       blk_rq_unmap_user(pdu->bio);
> > -             io_uring_cmd_set_res32(ioucmd, pdu->status, pdu->result);
> >               io_uring_cmd_done(ioucmd, 0);
> >       } else {
> >               io_uring_cmd_do_in_task_lazy(ioucmd, nvme_uring_task_cb);
> >       }
> >       return RQ_END_IO_FREE;
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but is there a use-after-free
> regression when a polled NVMe uring_cmd completes via an interrupt?

Aren't the blk-mq poll queues mutually exclusive with the
interrupt-driven queues? I'm not sure this is possible.

Best,
Caleb

>
> If the completion is not in the expected poll context (e.g. hybrid pollin=
g
> or a spurious interrupt), this path queues nvme_uring_task_cb() via
> io_uring_cmd_do_in_task_lazy() and returns RQ_END_IO_FREE, which frees th=
e
> block request immediately.
>
> However, the io_uring state flag req->iopoll_completed is not set to 1 un=
til
> the task_work runs. Concurrently, the io_uring polling thread in
> io_do_iopoll() sees req->iopoll_completed =3D=3D 0 and invokes
> nvme_ns_chr_uring_cmd_iopoll().
>
> This function then dereferences pdu->req (which points to the just-freed
> block request) to check blk_rq_is_poll(req):
>
> drivers/nvme/host/ioctl.c:nvme_ns_chr_uring_cmd_iopoll() {
>     ...
>     struct request *req =3D pdu->req;
>
>     if (req && blk_rq_is_poll(req))
>     ...
> }
>
> Can this lead to memory corruption if the unprivileged user issuing the
> command continues polling while the interrupt path frees the request?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827185722.32=
34622-1-csander@purestorage.com?part=3D2
