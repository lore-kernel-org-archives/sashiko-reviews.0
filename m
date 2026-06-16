Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9EF361668
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613516; cv=none; b=p58udzT760YVTBTTTuHNLkZQ27Dgf4VE3kiLNhqkVaRRqPn/FTXnDpjXDdk9Hl7FqH12pdAZ5roaRtmY+BNcM7pXsfNCu5IQi2Gu88MfYR17dl8bn06sZQG7DJ5NHvufGLg0jBQK+YDTuGV1zKajASTUHaHd1rmAcN4msynosUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613516; c=relaxed/simple;
	bh=0P3vVxz8gL7rCvQ0tZabWBtBKT5WGz1e8j8OWX2R4Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoG4iCLimeVdQ8T+wDaR8tjxWo/UKJIAyBmws0WdVMufkcedgu/T5CbSq1EuSozQ4G7XhNiGOAkoDyaue5RG7lyWkYpdvqLii39oyv+01y+I5d/vALPaajCD9ZgqpNI6pVnqg7Xf0POosUqgsmtBx2zjjwK+2uOtiVSPahRndgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhqUVn+a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhqUVn+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781613514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fP4KNBPXal0xYsNQqxjqO+YJzAsH0o8zuMkqZPzvj0U=;
	b=fhqUVn+awXGy4Pc+zBbjZtMsWHLdXgyUMlFGJq3Cy8ah+WRrsZWmVVsb8BWkcaRp+XjNti
	+Zn6TS1gwoXGoM886fdjnB4KlzXVD1023az+cFMpwSbESy/J0pdLhEEpKDAKv9kTfDLWTT
	QHFTaKO82Jmej0lslYiDtAvULelqInI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-HbbvNe6KMcSsTjnGQLOzNw-1; Tue, 16 Jun 2026 08:38:32 -0400
X-MC-Unique: HbbvNe6KMcSsTjnGQLOzNw-1
X-Mimecast-MFC-AGG-ID: HbbvNe6KMcSsTjnGQLOzNw_1781613512
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842208d5b0eso3670282b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 05:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613512; x=1782218312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fP4KNBPXal0xYsNQqxjqO+YJzAsH0o8zuMkqZPzvj0U=;
        b=qbe+FuA57QPrk2D33QvfK2wKNwqpaDljRKCRRXCDWH+PjJeGJ2om1GaZqkpiSIO/6G
         Xl9EQ1DYgdAqTOKyzAHbZalKr4W9RuDuAdz+tL/7VusB1ajJKNKHbZsHu4CkAyOiYW92
         ZbxJCjo40G0oZKr7Kg2jwBb9ig5wrULvy0vM4ZMOmS8y0SsheZfZj8SgZWxBA6UrelRB
         Icw+W9KHk4F6jM7ZMkm5e5ckHMWHn1csZ7d5jrVS8zgKJ8oI825lE/v76t6zdFll9Mbu
         YbKncCyRi+hhN3uoFILZY59DsqNn+l1yDgzVc03eJ7psVptNJqAvdoE2gPT1gV9DrMHg
         NIaw==
X-Forwarded-Encrypted: i=1; AFNElJ+OE350BzhMXDGpoiaYb945twAhv30S8xeael/BS2uIUYjTda7TyvHnMNAen3ht6T8t0BfHgKVxEh9NelyrqKI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7FXubos4EMmbRZudVndY4NDxDPYcvK+dilc6GnEMPNISVjYPo
	gpRx1rQ4XadP/YcD8+CH0ynzzjGjWXHtzyeb+LO7IqGlNbXjLTDT9Y05e4ByM7VuF/mKDKxU9NP
	x8qDW+nrdee5PQ4naUFtxUeosBCqGINeqaqcLWej8EHtcnNtDZfXRg5k5pUDAdithBiIrGs24Jh
	sZxOM/YjmyBTLcTA0Md9nkwMyMl608XqebjR8wsfSVDgdw
X-Gm-Gg: Acq92OHp4ybfn0WvQwiHv2j9OMfcraXEmOEHiO9PEPJ8g8yFbj9kf/eaoW3VfrkzaLg
	khtQRgH0b7nwbKkYgoc++JlrxoRn9jSRfFp81mT0V+oLsQovAKcS75BeMAxwSJWOHgsO6FpvTkD
	clBPwfxTCfZ5lSKTMutIRnrbySBZkvxoCU1ORkh/SA2UQV5NcOOyNdpZODJ2xVqxhx22QrtnzbR
	cv7
X-Received: by 2002:a05:6a00:6c94:b0:842:4387:34c2 with SMTP id d2e1a72fcca58-8434cd428e1mr20194414b3a.10.1781613511747;
        Tue, 16 Jun 2026 05:38:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c94:b0:842:4387:34c2 with SMTP id
 d2e1a72fcca58-8434cd428e1mr20194377b3a.10.1781613511216; Tue, 16 Jun 2026
 05:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613000953.467473-2-tavip@google.com> <20260614001033.09CCD1F000E9@smtp.kernel.org>
In-Reply-To: <20260614001033.09CCD1F000E9@smtp.kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 16 Jun 2026 14:38:19 +0200
X-Gm-Features: AVVi8CdJ3xdYYtix7Dwx2xqbauFvL3xBLBVpRoZ9oXe-9Rk1Z5stZZPwcYGezI4
Message-ID: <CAGxU2F7TEKS_Uo7Ank8W=itbx-FgaQa6L3jTV6_WreCP-0Crpw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] iov_iter: export iov_iter_restore
To: Octavian Purdila <tavip@google.com>
Cc: kvm@vger.kernel.org, sashiko-reviews@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 52deU3b8ZeVLUFGewOmzmDrkK1qk-m7DEmrk3e7vZL8_1781613512
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Jun 2026 at 02:10, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Exporting iov_iter_restore() and using it for generic transports is unsafe, as it fundamentally lacks support for modern iterators (ITER_FOLIOQ, ITER_XARRAY) and corrupts state.
>
> Pre-existing issues:
> - [High] iov_iter_restore() contains a parenthesis error in its WARN_ON_ONCE condition, causing it to spuriously emit a kernel warning when called with an ITER_KVEC iterator.
> --
>
> commit 169d794e6c649159c82a4c128f4edf768368df54
> Author: Octavian Purdila <tavip@google.com>
>
> iov_iter: export iov_iter_restore
>
> Export iov_iter_restore so that it can be used by modules.
>
> This is needed by the virtio vsock transport (which can be built as a
> module) to restore the msg_iter state when transmission fails.
>
> > diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> > --- a/lib/iov_iter.c
> > +++ b/lib/iov_iter.c
> > @@ -1469,28 +1469,29 @@ void iov_iter_restore(struct iov_iter *i, struct iov_iter_state *state)
> >  {
> >       if (WARN_ON_ONCE(!iov_iter_is_bvec(i) && !iter_is_iovec(i) &&
> >                        !iter_is_ubuf(i)) && !iov_iter_is_kvec(i))
> >               return;
>
> [Severity: High]
> This is a pre-existing issue, but does the WARN_ON_ONCE condition have a
> misplaced closing parenthesis?

This seems a real issue, right?

Should we fix it (in a separate patch/series of course)?

Stefano

