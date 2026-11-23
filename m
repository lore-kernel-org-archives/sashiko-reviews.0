Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459552;
	b=j+7Xct7Z0+y9TrBv9zHbHTLd6w4kvl/QHN7YAQ2zaBKxQ/0VBEWI1UMQHOb5Z2xmmRXm
	 qCY+mCyb2L4othuWurl9nEb8RdZ5NhpeEhv6i0MNERDcV88yAoojpsyaeapS9oHSONHMO
	 LfZuzPS2MH2DZEjI0uTqpRGaFAQmX5slFauTRvE73DOKb/12zPXFXxNsxWD0i7scbQf/3
	 t85mu/Z4r/aPnrHAqGJcXcOrujKKoWLWwt2rUpvx1JDjehQ0v5Fcfju1tc21Ava+0fQ5A
	 mExmp2AxyKVPS4YJivLqDiXiQNkrf8/LvPR66QjhEwIOgYxD6cMD2ECgI+MGYQ0Tcug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459552;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=yLz31rzEEz8B8LvaagkLUBNRVU/PkTTsvaMuzc+APJg=;
	b=35wUzGJk+FkJHFSdlx7dn30bmQvy9FvgRJWTmb5kRzVoHlBzxxx7iwQW49aSf0GIJvBS
	 bpVjjhJQeW3r+jKBmO1YFX0MbWGXeut/iqrMDfUxMnTXKvBiDkDMicT8lgPEWnNDUgQ5+
	 YQV9DbWTcSCDLHpxZEBxpAu5XpL/ZswDdF3iZhr8DoNcjF25MYEUgsmDnhVnqVKFof2xe
	 AzdevtTMJZSyNRjz2CqSKX3piEyGTxcKJ2IkIjoI7AKB/f3mLoqZzXYHWSyXPh63NQgR1
	 DtoQYpR9EfhszraEJ6acGGzW5HcKmMlrtPuHPd/XZXoauDg35QO+dVwGIaopUsi+trA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EI1bNRSp;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43C606A321
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 18:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F43C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EI1bNRSp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795459550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yLz31rzEEz8B8LvaagkLUBNRVU/PkTTsvaMuzc+APJg=;
	b=EI1bNRSpbfBP/NRB22tzFT0EeUzNG54NGxSI4E113oTdQHoBZdBSrCh8w3gW9YyXtpWWQI
	MxwLG892zUDZo3+P/z1xdhpRB5amLq0JXgF+V2joMDGKQ4XMkvTKJf1ceIQdCv4l2+d/8i
	9EYJeUEfgEq+O/rQgllfe76uhesQhfc=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-pksEKLP7MtKK6okcQv1ZJA-1; Mon, 23 Nov 2026 18:45:48 +0000
X-MC-Unique: pksEKLP7MtKK6okcQv1ZJA-1
X-Mimecast-MFC-AGG-ID: pksEKLP7MtKK6okcQv1ZJA_1795459548
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5004146eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 10:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459548; x=1796064348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLz31rzEEz8B8LvaagkLUBNRVU/PkTTsvaMuzc+APJg=;
        b=ITBbZGt7jpuUJMy7bEYgG6gowmWvF/dt342SXGvI4gCb54iSV5x8PHWEjSk3E2fhcC
         GwgK2w0B3wQxwGHg9r/B+BiI4neTgI5ZXbpXnVnglXRUBVjOqCzca5gXd+lF9wbA7OM+
         Ys1YW19uPrd4o+MilccZfPfjvYUUd8fjOUPDK9tHlggk6oaizmcvIWfz9WkQEbA3C7hJ
         2gYYyojhJeDC7osWvpxOW2ttoakTb8RVBl50EMbKnfoXvHFRYHvpLaI+IUERKEYKtdsZ
         OhdYk22mTlw1AzuCc+SFDrod7ZHK+mXe/WteSiW/75Wju/4ohm7uycWyi1WbNV/nERzn
         43Uw==
X-Gm-Message-State: APuU4Z/aAmlHYH4CDvbJb+zRCZG+gru27VTymIoLuoDAQn98ui7hyx5t
	Cjj9n9thqse2YdLANVpdF6ZsOCFqQZbImRjSbdOKK/EeW2RRzUjjpK1BG47lDtARWGk42rIuWxV
	0aKwpBafRdqB23ER0OYITRnM9T8SmQFyeoW/33uKzMlOWb5xGOXRZGV84o7jACh/BpeBSbLybSw
	JXxvlCi43a3E6ztI3rycioP/wIsb/Bn5iJk6MrtgNberTEWfYoNqrd
X-Gm-Gg: AZFdTZestQ4un28BsAdPLxfJKEprS6ibrrAcVp1mkfTZPXi9eAL0HF69iaG0NW5FZcU
	QthxoDDawXQ1Q2uMiEackqDenlBelEEUb86fe7rzDuiSTe5W0BfVCV8vbL77ngkUmU3AyWtjw81
	HtWynI8iSU0JkRe7Qh8imgYX0KwHMgXc9MuhV3D9ec0OPfxMF9oaAP0QMe
X-Received: by 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr16030781eec.17.1795459547462;
        Mon, 23 Nov 2026 10:45:47 -0800 (PST)
X-Received: by 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id
 5a478bee46e88-3856f7563b1mr16030747eec.17.1795459546910; Mon, 23 Nov 2026
 10:45:46 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120200040.257152-1-aahringo@redhat.com> <20261120200040.257152-4-aahringo@redhat.com>
 <sashiko-outbox-226014@kernel.org>
In-Reply-To: <sashiko-outbox-226014@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 23 Nov 2026 13:45:32 -0500
X-Gm-Features: Aa3M54q5RFylsWib9aLOt62IDwRHbAyAXpdaAKRwedV-GMP5_zeZT8TffKwDAYI
Message-ID: <CAK-6q+gC1kjNi+toH5pJHtMVRM6hRY2u9bpYrNu_ARQ=hboV3A@mail.gmail.com>
Subject: Re: [PATCHv2 RESEND v7.4-rc3 3/5] dlm: don't publish a lkb in
 ls_lkbxa before it has an rsb
To: sashiko-reviews@lists.linux.dev
Cc: teigland@redhat.com, gfs2@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sZtR2E12eNVDBXfntZtYdBFg2Zzy6WdZ-GLryAfzk8A_1795459548
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 20, 2026 at 3:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dlm: __put_lkb() erases active ls_lkbxa entry on find_rsb()
>   failure
> --
>
> commit c68d5fa6b30984a97220ff35d349c3276a988660
> Author: Yogesh Gaur <yogeshgaur.83@gmail.com>
>
> dlm: don't publish a lkb in ls_lkbxa before it has an rsb
>
> This commit moves the allocation of lkb_id and insertion of the lkb into
> ls_lkbxa from create_lkb() to attach_lkb() so that find_lkb() never retur=
ns
> an lkb with a NULL lkb_resource.
>
> > diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> > index c715e171bab7e..3b3e15157f4c9 100644
> > --- a/fs/dlm/lock.c
> > +++ b/fs/dlm/lock.c
>
> [ ... ]
>
> > @@ -6300,12 +6324,14 @@ int dlm_debug_add_lkb(struct dlm_ls *ls, uint32=
_t lkb_id, char *name, int len,
> >       if (!lksb)
> >               return -ENOMEM;
> >
> > -     error =3D _create_lkb(ls, &lkb, lkb_id, lkb_id + 1);
> > +     error =3D create_lkb(ls, &lkb);
> >       if (error) {
> >               kfree(lksb);
> >               return error;
> >       }
> >
> > +     lkb->lkb_id =3D lkb_id;
> > +
> >       dlm_set_dflags_val(lkb, lkb_dflags);
> >       lkb->lkb_nodeid =3D lkb_nodeid;
> >       lkb->lkb_lksb =3D lksb;
> > @@ -6321,7 +6347,15 @@ int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_=
t lkb_id, char *name, int len,
> >       }
>
> [Severity: Medium]
> Can setting lkb->lkb_id before find_rsb() cause __put_lkb() to erase an
> existing lkb's entry in ls_lkbxa if find_rsb() fails?
>
> attach_lkb() clears lkb->lkb_id on failure for that reason, but if
> find_rsb() fails first (for example, with -EINVAL when len >
> DLM_RESNAME_MAXLEN), dlm_debug_add_lkb() calls __put_lkb(ls, lkb) while
> lkb->lkb_id still holds the caller-supplied id, and xa_erase() removes an=
y
> live lkb already occupying that id from ls_lkbxa.  Setting lkb->lkb_id
> right before attach_lkb() would avoid this.
>

although it is just a debugging feature and the user (root) needs to
know what its doing as it can break a lot of things in a invalid
production use case, yes it might be better to move that before
attach_lkb().

- Alex

