Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793115909;
	b=3i9WEqA6drYS6lGIJyCHc1zAO2thM7GbLWHy4KqkwF8gBxh/3gKzuuBErJ3XLpKLVgIv
	 gg/tL9ISf+OHW7/lFDIIoAdUOdPlXRnGeH+SPaV6Qxsu8YemdYbWk1VhUJJTQQntdX7bw
	 qvhA6DeH812fSAp5AqfExxaohnRlCLaLIq4OsZs44T+XHIOpynPtnnQv3fimfEPBPPLRY
	 syksi4PCnwAsU079Vih0ZPzSfRqs/Govzp7TijYh3OdWvrmxoa68r+9pKBkV19inQHffy
	 Eh2nPJe9CeZYMnd/R6DsHpHyzr9v0gbpSbCqhf+/uc/pdXLaTXHaYwMjLo2uo+ApJQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=7qVC9UUYwsvf3txmzp76sMUotGQnqFYvIzeVPR+E2O0=;
	b=eGRY5MJyzJrQQOtA4/UoBeY+j7gHiAYyvA1J9mHWMcZoscS+w8BDgy94ka+IVUXHAuGz
	 nNG+2UH61BcVBA6o716GldXrP/ySHopOZpiQIbavucBIXWTRt7wwiYplvLAVs2XSOlLR8
	 yQbJnSwWHsrwOiF2SGAKw6RWQEC1V3dHsG+xskl0Jr/sFZYEYAvq4t9y24Y4kLB+Juvrk
	 OMixYv9sdxmODNS9Urh50f5pq9/v+Oj/d4BLTPDhSti5dOMutmMd+wXmZSkfqS4ojDQj+
	 lwfZoanYOG5pOQ2Cv5N+H5ah1pBhyv8IhI9X+MX/KgIZiMPmK9ycdjgnPcetMHASBNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fX0Klngl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.68
Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B9606D943
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 15:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3B9606D943
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fX0Klngl
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3ab490442ceso25179271fa.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 08:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793115907; cv=none;
        d=google.com; s=arc-20260327;
        b=Q6fncSQ0NJ8g8o/hSUBu92nALsvOFO00HjSS6XFt2kFSuN+GiJcjgkL8iNtS8vVUdJ
         JThdayZt17/eUCyhb/Yc4Yi3H/C/y4D+ex0CYqXiEWeIeLb1pyxTJxKFyNo+tTDEtcxC
         T0SCaiM5jTe3CwPWahC5WX4fMf0R73Q4LUQiL17nTeZb71uc+Is3zoKtLHZXJj37GjOe
         JsXK/ykXSS/bStY8DzJQC1g3L/Wvfsu3SSwCZI5TVsDUk6JXUfxcdO63x7CfC/gKxLXE
         ExsTJZar987HFgG87adu1vbWOk3EDEmhrAHgTrlMSruceUfZ1QywvUVNJG/vHVWFVAZm
         a8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7qVC9UUYwsvf3txmzp76sMUotGQnqFYvIzeVPR+E2O0=;
        fh=gUfsL9ppqjROwdjOOpA7gVU01au1qshFQ+BhECdF0Kg=;
        b=ipQYFjFcKYhmTg9TfRIUNB7ZOTRepJfPYJr97lqGyEWt19hHCZ+4uUow/djFgM4LsD
         fqe8A/R28CATX/kBz5enNbL3KfuWGWDD5bgozRlHrAPPwbmqPKd7wVVYqIFfS8spjS82
         IlNc7mZUrE5C3vT9fBM+qFOpOgSQw88r4WsXYLOnS5Km1/Z3PgwR3VnL2aXVbqg2YYyS
         RKZjC/VKGVg4UismRxNgHSqtx1jdLCNmDMSTQZMJFR3UMan+d+DwQ2cQwasIuDkmUn7/
         ZNYkvyDvcmzsqPZtQmU8lfRP331Ggmqa2GwPpixhnhFePL5PB9z4w8Lb6v/Nd2R92CT8
         EeXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793115907; x=1793720707; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7qVC9UUYwsvf3txmzp76sMUotGQnqFYvIzeVPR+E2O0=;
        b=fX0KlnglkBYjcrLqMMDX2/IjWOLwjvHTDuMdQAuKjcrao+6jQIoP03wmxe182TLsLV
         faaN/QaQ+aOZi+/e3NP7IffcDi2ZKS5zcPUsVVgUCNiITcmgA/ZpeBs46TXDD4ylJbBK
         vNd230SWliBy4mRwtqJoEfItaidiZ/lQ45kxOWtbbw8wot6czVV4jyONvAhNdcPfhQSQ
         01p92CNxj4h+ePoav8LcRD7hXOduTlx7HbAOHtgB7ytlnuOPdADj9mgznsjYoVNnZIgP
         Ct710xJZi4TEdvGcXTzcaQd8nEO7Kf15r+v1yu7dKGPVWmHF24SF0X4c9Tbuoldfr0kh
         nPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115907; x=1793720707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qVC9UUYwsvf3txmzp76sMUotGQnqFYvIzeVPR+E2O0=;
        b=tvy4AtTgj9+0y4HnL+z8eV07KVwY5auEJ5UquGgKd16KXv2l4dsAhaKnG1PagONpJl
         chA020jeei/ukJ5wxzySik4TLjOLhGGgti2B7mauod1FWJbi4MCCNGUfXWcOgKOcmZJo
         5/Srh8fgk1+YiT9A/jJPfqxi4E3qKpkG98L52bsM4ENh9LUu7otYpYdSNq1H3sP48yvc
         UH3XePHh9v4KTKymO2hAyB1mmfr/rLnldgawZfLnC8aG7ObWHJnysV2jTarX3m48vQaK
         7wRDuXSLiWMIhU5uGAiJ6M7xAfrbEAzEn+K+KfM5/aDkFIXUX1IvgtLoEWbzqDeayzoc
         co0w==
X-Gm-Message-State: AFq9FYJhLHhHYXjxhKyK35JqrPIrkoScWreeLcytvRMKkuAB58wTwUj/
	GUgIy9Gsl8O+MqI7UMSSZfFwVm+i8tkus9bHM0NxLm6OuYY25aK6kMJKXT7BirbW6Vxw2lc0kGx
	X5ZMkl9tBNjsMOfQrUxzM6/BXmegiu4OxsKKVANl36Q==
X-Gm-Gg: AYBFou3h0Ked17evrstCqJ+1aSwjkUZXmVT9rgWQzoTxRvHQlbdSDxWhyZMWf437ZJe
	CELiw3bqnS8gci7Lky08Fg9s+ixaU+7jH8tH+vXwA8enRgN1Qz1veiVwj2/RPZ26l+hk6EPTvpk
	/ntaVlZmSx8LodKBJINJlg4tZMxQiVSSIxTEDYTCXvfBJ7RpwFptVllXlL31toQycQEp7hm65tA
	tgT6Fm6HfEdT4Rv5X3Az3QYJ6uR8jUmh50ug8eVtdTY39oaYsH3FYkN2aHRwkpd/0KExnPFEodF
	rnWkRYDeTVZ+Cl5gMK9OBscWFd+mOZnKQjr8dGGP+tM5UWTpxeSAg8opHFbK+t/a63hmCN2b6Mg
	q0K9bRPI+fRzgUy5wDHqGYGe8HmVs+NuqHvQlMQ==
X-Received: by 2002:a05:651c:2118:b0:3a6:4452:bff1 with SMTP id
 38308e7fff4ca-3ac6fd1896dmr27035421fa.16.1793115907142; Tue, 27 Oct 2026
 08:45:07 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027150752.951217-1-bsdhenrymartin@gmail.com> <sashiko-outbox-186828@kernel.org>
In-Reply-To: <sashiko-outbox-186828@kernel.org>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Tue, 27 Oct 2026 23:44:55 +0800
X-Gm-Features: AclHuK8o_x8D51yrjumY0OMRV8pch24SxXC-FujqEcNgHdBayQFoQUU8OSZPKKo
Message-ID: <CAEnQdOrkc5EMpWBAreTOG038brf9LcfffL7psoNO50JiFt+8Fg@mail.gmail.com>
Subject: Re: [PATCH] scsi: qedi: fix OOB read in login/text response completion
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correct, thanks.  Confirmed in-tree: push_callback_call() only
propagates -EFAULT from btf_check_subprog_call(), so the -EINVAL
path reaches check_stack_arg_read() with caller->stack_arg_regs
unvalidated or stale - and it is a heap array sized by
out_stack_arg_cnt, so this is a NULL deref or stale-state copy.

One refinement: set_timer_callback_state() (async timer/workqueue)
does not set in_callback_fn, so that check alone misses the
original frame[-1] case.  v2 rejects on both:

    if (vstate->curframe =3D=3D 0 || state->in_callback_fn)

pw-bot: cr

Regards,
Henry

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8827=E6=97=A5=E5=91=
=A8=E4=BA=8C 23:23=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] scsi: qedi: unclamped dlength in qedi_process_text_resp() and =
login_resp()
> --
>
> commit b81ce3a14651452d3f551e4635d2337a8b305729
> Author: Henry Martin <bsdhenrymartin@gmail.com>
>
> scsi: qedi: fix OOB read in login/text response completion
>
> This commit clamps the payload length extracted from the CQE in
> qedi_process_text_resp() and qedi_process_login_resp() to
> qedi_conn->gen_pdu.resp_buf_size before advancing resp_wr_ptr, preventing
> an out-of-bounds read when completing the PDU to userspace.
>
> > diff --git a/drivers/scsi/qedi/qedi_fw.c b/drivers/scsi/qedi/qedi_fw.c
> > index c8af10c326532..5e20716043aee 100644
> > --- a/drivers/scsi/qedi/qedi_fw.c
> > +++ b/drivers/scsi/qedi/qedi_fw.c
> > @@ -115,6 +115,8 @@ static void qedi_process_text_resp(struct qedi_ctx =
*qedi,
> >
> >       pld_len =3D cqe_text_response->hdr_second_dword &
> >                 ISCSI_TEXT_RESPONSE_HDR_DATA_SEG_LEN_MASK;
> > +     if (pld_len > qedi_conn->gen_pdu.resp_buf_size)
> > +             pld_len =3D qedi_conn->gen_pdu.resp_buf_size;
> >       qedi_conn->gen_pdu.resp_wr_ptr =3D qedi_conn->gen_pdu.resp_buf + =
pld_len;
> >
> >       memset(task_ctx, '\0', sizeof(*task_ctx));
> > @@ -294,6 +296,8 @@ static void qedi_process_login_resp(struct qedi_ctx=
 *qedi,
> >       resp_hdr_ptr->status_detail =3D cqe_login_response->status_detail=
;
> >       pld_len =3D cqe_login_response->hdr_second_dword &
> >                 ISCSI_LOGIN_RESPONSE_HDR_DATA_SEG_LEN_MASK;
> > +     if (pld_len > qedi_conn->gen_pdu.resp_buf_size)
> > +             pld_len =3D qedi_conn->gen_pdu.resp_buf_size;
> >       qedi_conn->gen_pdu.resp_wr_ptr =3D qedi_conn->gen_pdu.resp_buf + =
pld_len;
>
> [Severity: Medium]
> Should resp_hdr_ptr->dlength also be populated from the clamped pld_len i=
n
> both qedi_process_text_resp() and qedi_process_login_resp()?
>
> Earlier in both functions, resp_hdr_ptr->dlength is written using the raw
> unclamped 24-bit CQE value before pld_len is clamped to
> qedi_conn->gen_pdu.resp_buf_size:
>
> drivers/scsi/qedi/qedi_fw.c:qedi_process_text_resp() {
>         ...
>         hton24(resp_hdr_ptr->dlength,
>                (cqe_text_response->hdr_second_dword &
>                 ISCSI_TEXT_RESPONSE_HDR_DATA_SEG_LEN_MASK));
>         ...
>         pld_len =3D cqe_text_response->hdr_second_dword &
>                   ISCSI_TEXT_RESPONSE_HDR_DATA_SEG_LEN_MASK;
>         if (pld_len > qedi_conn->gen_pdu.resp_buf_size)
>                 pld_len =3D qedi_conn->gen_pdu.resp_buf_size;
>         qedi_conn->gen_pdu.resp_wr_ptr =3D qedi_conn->gen_pdu.resp_buf + =
pld_len;
>
> and similarly in qedi_process_login_resp():
>
> drivers/scsi/qedi/qedi_fw.c:qedi_process_login_resp() {
>         ...
>         hton24(resp_hdr_ptr->dlength,
>                (cqe_login_response->hdr_second_dword &
>                 ISCSI_LOGIN_RESPONSE_HDR_DATA_SEG_LEN_MASK));
>         ...
>         pld_len =3D cqe_login_response->hdr_second_dword &
>                   ISCSI_LOGIN_RESPONSE_HDR_DATA_SEG_LEN_MASK;
>         if (pld_len > qedi_conn->gen_pdu.resp_buf_size)
>                 pld_len =3D qedi_conn->gen_pdu.resp_buf_size;
>         qedi_conn->gen_pdu.resp_wr_ptr =3D qedi_conn->gen_pdu.resp_buf + =
pld_len;
>
> When __iscsi_complete_pdu() calls iscsi_recv_pdu(), the netlink message i=
s
> allocated and populated with only data_size (the clamped pld_len) bytes o=
f
> payload following the header:
>
> drivers/scsi/scsi_transport_iscsi.c:iscsi_recv_pdu() {
>         int len =3D nlmsg_total_size(sizeof(*ev) + sizeof(struct iscsi_hd=
r) +
>                                    data_size);
>         ...
>         pdu =3D (char*)ev + sizeof(*ev);
>         memcpy(pdu, hdr, sizeof(struct iscsi_hdr));
>         memcpy(pdu + sizeof(struct iscsi_hdr), data, data_size);
>
> If the CQE data segment length exceeds resp_buf_size, won't this leave
> resp_hdr_ptr->dlength advertising the larger unclamped length in the
> embedded struct iscsi_hdr while only resp_buf_size bytes of payload are
> actually present in the netlink message sent to userspace?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027150752.95=
1217-1-bsdhenrymartin@gmail.com?part=3D1
