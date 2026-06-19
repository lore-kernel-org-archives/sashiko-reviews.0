Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47054823DD
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857531; cv=pass; b=NT67KD7IwQ7KVbheLRTm22i+QcI6162xf0ybeGX6ffhhPOmqNo2NBBEEbIDik70/ifctXnomIj4W99Q00MVI6DUjuxLqM/n+CFRw7/Nq7v6RKY93NCZFRFMNQGfu2bmlgqsSlwVAfwiCFlBO34AbOySLTIN5SXxtko+kskyd9zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857531; c=relaxed/simple;
	bh=h22ve8W/AMMGoQTgrDvL6p2XoTwz9Q2Vh3c4CoiRQGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeG+6imENrgSF5GuUibdvbjPKUGTOc+vT6wfAuMRxUJepvX+Pn21Xgo67IAWp2Q3djDSq/1udmzdnDeV+w4DceSyj+n2Z83dcF0DDzA8TEQCoOHDu/BFEDU6nHulfUHXfNO+72Qc6STsornr2VlkT0qBSiQJCmZFb5hD7XTkZBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IGZ8g2Ih; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IGZ8g2Ih"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-519ed52bcc6so102071cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 01:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857529; cv=none;
        d=google.com; s=arc-20260327;
        b=LAnCBBvoue4zktiRNNwIaQoJ9Lp+8tkmhGONFgOYyUqik5drBG73SbTE33+9KiFGsx
         k1zEkbg3/e/4eHKY04Un8I0Gj8KpvyFJzSEIFOoNCv/3rx3YKO/aaFeZxMzyJoLGNWNh
         tLf/NA0U1+yQDr6TLkcmAXIgzNjOMdP8gySyzMwmbAF9nLo3k43qJFIR86vPKnpnJOYd
         VdA/FHjqSoPxf0maJy/PdZmQBhZV0rnkl/IDYs/y0hu+GZ8iqNd6rHNVg24vgkR6jkXQ
         g8K4rPYBjcEkg3WXbw9Iupp5ZYziG1HP2hoEZGEX3OHT8W+GglLNTRbe75W1Rjk3gzHG
         Be8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TxeIafjVeRSfliAEGIJzlXDLNa8j87RID43xBzL+1lI=;
        fh=QO/2cIsGIfGCLZGcA2ucK9O8KUAei36yLEXUwefekOc=;
        b=VqtvhHxR5VX+lkcnu+h6WrrYTlwy5A1cKfMO/SA90ySqVYTqGX10gf9ZBA6iN7iVen
         vfjvjh/VsfwKveLQdSKCowG+KHDeMQtufbMIz1s4Bs2njzHe2YjfNFc2kwv98nGHa/5R
         sXKmp8lJiEQmuBXZZ1F2nrjylElv+xUCU21Ode2Khy94XeSsii7fdXkeIXSLisAG0IjK
         mCcfAgHonqXOJyxQ0N6f/fX05rkIIpYgw4xeCBAR2QS4MxXDetoWF4fLY6L3fwUJ0V0X
         DTOof4p2M5XxM1J0ycAMTmUqlNJZJpZ7l773HgpmwqMqRW7eNJgfZWla+AjJ6g9IHbA/
         p6/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857529; x=1782462329; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TxeIafjVeRSfliAEGIJzlXDLNa8j87RID43xBzL+1lI=;
        b=IGZ8g2IhXomsEZnr9Ha9ckHHiwKWPnqttA3JCiL6N8pE6Xx+3zXD9Mn77aYbhoJ7Ne
         zjKNfQ6YtzAxv9jHKAd2ybqGBV3S0EH55UhMuA9vOG85oKNW8Yj3rZbUon5BWBxheQ4z
         4PjZcwyBd0dYWioJKcE60mAqHjbnvGqrUpxzmN20pVfrIzOELmjNDJRXE2XVpSKWzb2Z
         j5VvvdB04Owb4BAUAjcx6y5ROKQGtCoC83RXdAJUpNST6qtyk9EIvXUx6osxFTFpfWYw
         gp1dSKyBdtBH9hDxEUJybnWB4U0YAEhEO40pN3BwNeR3L9iabOgVtbG6FjrPSQcAdlX5
         ARxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857529; x=1782462329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxeIafjVeRSfliAEGIJzlXDLNa8j87RID43xBzL+1lI=;
        b=FFG7lwkAX66YPWq3U1cDVB/oU99P9nEg1+dgleOmXR1pLQJBFL/NBe4BPWcVxcSsJa
         B5+S7FnRfrpWPThPTYSaAkCg3sW3eit7L9Ac8lEQtq3NdDUtmMR5DdfDlyNgvUEK4qxn
         qQLXg4A6tiCBq8XhNbwdh/lDPrOWvcyTY5D0MSy8CxhyxUiArrp/qfBDm66nX9hxMJD5
         ND3sXLsmaptr3W3IOgHzDkF3X72r7d9J+Yt/M0rdTpeF1cwLWOrYjuoB7SjDYA+juKId
         tpHjyN0oyGLqd3uuAhS9DVMVClosFxeqjYoUw7bSHxGOzqUJclCxfq4ygyS5s8rgoS2k
         viYA==
X-Gm-Message-State: AOJu0YwYntxD8bOgrUYXwDER2J84oBwVOB1lKjJHGBktz0o9IvGvG9tX
	+1SXEbqI/RyIbpGpx+dWTYkUAXynugm8DPX7F99K0yd6H11krp1fFGyQBjO/xL4QzICfsW4YGNn
	7v+3rpqxSq1SfMyYvqiIHkjGnly7XNaoizpkHdpFcVHqEObz1+83AsGQd6mY=
X-Gm-Gg: AfdE7cnysUqEsgF5lLbiAHBSR7MjFRmP9flYymXe6r9hwwiHSkb08N3cGnxdeWWBZTz
	7tT3Dw+a3D5+0VAc5kwAnqyqj2JAKZtL47/OQv9P7z5erI7kAB8DjBWkcTMIjXbkp7c1dbsMBCX
	+B7WpND4XrLVfMMEz1oARwp848cTMRN9xZdbDfaIQ/eSbYiwmegk0Ye2LWzJZOoqmCxlczRf5OH
	X0csf1qm1AIRmBfrbrr5iNf+A/dlXS+9/xj9gm+clGH+2SvHQHOVSjpVfceRGIGfG7xitCAHA==
X-Received: by 2002:a05:622a:82:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-519e48867afmr6336961cf.6.1781857528567; Fri, 19 Jun 2026
 01:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com> <20260619004918.378771F000E9@smtp.kernel.org>
In-Reply-To: <20260619004918.378771F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:24:51 +0100
X-Gm-Features: AVVi8CcBvC8TtgogaTN3EUPr2ibU9wi2w0OnsKTZp__1iLlZ0ogFy1kJC5a9Fls
Message-ID: <CA+EHjTzh_FxssbW62ejsbjBBks6YmiNc=9rY=xh5tkTFpkqDKQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
To: sashiko-reviews@lists.linux.dev
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun 2026 at 01:49, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] `kvm_gmem_is_private()` hardcodes address space 0 by using `gfn_=
to_memslot(kvm, gfn)`, which breaks multi-address-space vCPUs (e.g., SMM).

Same limitation as the per-VM kvm_vm_mem_is_private (single xarray
keyed by GFN, no AS qualifier). Not a regression.

/fuad

> --
>
> commit 8dfdb2d13d27c9727b32ecdcb6460d23702e6438
> Author: Ackerley Tng <ackerleytng@google.com>
>
> KVM: guest_memfd: Introduce function to check GFN private/shared status
>
> This commit introduces a new KVM utility function to check whether a give=
n
> GFN is backed by private memory. It checks for a guest_memfd file associa=
ted
> with the memslot and queries the inode's private memory state.
>
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 8101f64e0366f..bca912db5be6e 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> [ ... ]
> > @@ -510,6 +510,37 @@ static int kvm_gmem_mmap(struct file *file, struct=
 vm_area_struct *vma)
> >       return 0;
> >  }
> >
> > +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn)
> > +{
> > +     struct kvm_memory_slot *slot =3D gfn_to_memslot(kvm, gfn);
>
> [Severity: High]
> Does this code correctly handle multi-address-space vCPUs (such as SMM on
> x86)?
>
> The call to gfn_to_memslot() internally looks up the memslot tree strictl=
y
> for address space 0. If a vCPU is operating in an alternate address space
> where the memslot layout differs from address space 0, this lookup could
> return an incorrect memslot or no memslot at all.
>
> This could cause KVM to incorrectly treat private memory accesses as shar=
ed
> for alternate address spaces, potentially leading to incorrect page table
> installations or guest memory corruption. Should this function perhaps ta=
ke
> the target kvm_vcpu or the kvm_memory_slot directly so it is evaluated
> against the correct address space?
>
> > +     struct inode *inode;
> > +
> > +     /*
> > +      * If this gfn has no associated memslot, there's no chance of th=
e gfn
> > +      * being backed by private memory, since guest_memfd must be used=
 for
> > +      * private memory, and guest_memfd must be associated with some m=
emslot.
> > +      */
> > +     if (!slot)
> > +             return 0;
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-gmem-inp=
lace-conversion-v8-0-9d2959357853@google.com?part=3D9
>
