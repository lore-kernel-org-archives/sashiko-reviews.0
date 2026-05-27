Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF933A6F7
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 22:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779921944; cv=pass; b=b4bJ3RF31Ex7WFv67LN8c155NLbiEXKOf7vRZCo3kkVCAu5H2c5biii2A9vNL+C+rV0RULzBWUzF+9cuJiUvRKB3KyNh7qeH9NRUaV0v7kH+Upe0bTLNDzX9TpZp7d/kfbolW89iQpygFwlGJ/kUIX8Qbh7fK7iMdKJk3L7RaMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779921944; c=relaxed/simple;
	bh=6e5WtMjcBsDBDJ8IqEqJkKqSEnkZJFoCsLTVw+spA/g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE4gbEBtdkCNupgRK7bhkwm1W7ZrHOdqWlnxozRNBKzOvORBu8hpz+vJTqy/wRLAqZ927MO+/PfGN3LBNfBTBkLy4aoqo6xedPKZ2fGq9lpzBy3iFQ/GmzcmC3hc+9kDo7yyaeF35B3tS78PUPIJSjvhrbB91mmkpUfAGDe6tbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=epgCSNdP; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="epgCSNdP"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-135e7f4a295so5109980c88.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 15:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779921941; cv=none;
        d=google.com; s=arc-20240605;
        b=EH6D5nP0l2ijXog8Fdxk8vzxd8Wn+lqvIbevPXQhHbVJX2OKdSjxlSxTt7tEN7ocN6
         aXZovnv98B8VQPcABgMXUxDpDWN0nh66RZUBdIaR0dE5o9Za9yvVx7LOZpoyqdZIGQmU
         rZocCJFwnM08JBJutrKPoTcHgEU6JeXnDm1DYLAhNLc5t+6T7P7niLcAwUfNmLUdQNMv
         7NbZ8rqJdLWYj6tjgd+RKPQUQHOuNSDMly0pT2bWYRHcPNaNlUWVnge+1FxM+DNyBON6
         rrT5U2BlcRpSUPXOIFiFo11faV2J4URNRztuyBIroIVVHJAeiTccUxhIb9khMK9ZGJgq
         2vKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=+lPtc5dmsndYutIZiuP5KynRR1ndlzwDT+9x2AXFaWI=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=MSi7k+DpWU5pGJOLIdvsR/Vr0MFFHsyOkMnOx0E7BHR8lJ+Jg7JHq9jCEvj9AdjSuk
         m8HKgIElv0xsRNBzwGxXz3uV7PnLUpKxMROst+93X1Gru0kvkeb0RgZ7zZhyjVmrzyz/
         0T3Sqz5vBiXvGYzTLNOmTwWfcEDjdfOoFZbEmUTTlOAvQiBMh76FgDGFaedBFKnLt3XA
         4KowXqoBKdfPDMCiinf1LcE8C+4iKIuXspE+G1xsj4ABfo98+3+GY8TC+Fd/808WmpMz
         A9xWYRY1ZvhkP5sVsGLbmqCvk2mHRaE/6Prfd8WSfCUzo6ao6B158EczVWNv043qDFBK
         TqvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779921941; x=1780526741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lPtc5dmsndYutIZiuP5KynRR1ndlzwDT+9x2AXFaWI=;
        b=epgCSNdPbclLhhsEG12BPf0LJptglOmMPmiJj762ZQQhZdhskaEUqDoPqzmU9qdZCj
         7nm1qWrQHYEgobVJRct8GsfbUYURQUKgfmbYcsDb7Jta4lbJPIQLEgE9JiLvPT3MngHk
         29EwfDk/9TaN0BYjcbJrwOusryyP7io+ElnSbq6v0Vzb5GNzUIhW9Mi1G1/LVRWs/7Kr
         WfEF0gQqT7hx/GwXTIQ79YPrbJrPCI5lD2a5t9GTYJlZmqkXp9dXa2zTFAKhhbrSgmc0
         Ju6UUDGBE1b4AHlvY4+5e0xvGBCVI8d/28LjNvx2MUpRCC5pwUaZggsIXfKT63gbbvZR
         mk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779921941; x=1780526741;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lPtc5dmsndYutIZiuP5KynRR1ndlzwDT+9x2AXFaWI=;
        b=gz/WVrFsinZFFVqz1XyNHLOeEFQKk2j+ThlTGTY0bXRwGx0bnjtiSs9zIq89Q33quV
         1mnolwLOOGcieleYoxMcBL3DWXm4/rmH9gCYGYl5lpJIaZws6V605ILK0e4cRTnLMsH1
         LM0kSKzd2uzuhuiJW+v8FjoNYpeoW6TnDhffh9VmojYr+VujL/jw2biyvtuJw40jyX7O
         +OCcMMItgbwScvg+L96ho4PhGJjqiEcy5RjQVkdYI5wvBWAnK/rZb5+02nvuUKFfDG5e
         eP2zvb9Y6b1YzQacC0guW832NKZ1OYv7dN1bEOEd54xhwItLRO1ls+L26BGomRWmQ/Mt
         H3hA==
X-Gm-Message-State: AOJu0YzmHaPQWITNflAaa5hBZ7T7kGgtIY2X3Uj4OlIK/mI/O9kdDkVM
	EuhV/iBNUC5UjS6NfiY+/ZIYIhE0k9TKGIG/62TFH/H4jl1kvb1jAUlPsOg82fwPBTMcE8yO4Xp
	0AKXLF8/aJfY/O+Oftcd0PlY0OmNcFF+px2FlsN+53xP/HDK3sucp4IcUWBQ=
X-Gm-Gg: Acq92OEhY/Wz6B5qUT7dXmNCXIt2ycS4jf1x5ds7k33ICs7f2D0GL4CFcuX8xvHuA44
	X5lOOY2z+WH4p67DDrz5ZSw+fedQ9RHLTP5NuvdB4IqEobKKkvbsXASuPcbzEEXX0EbL5v5s+pb
	mF7321BaASPGBBT+BK7WRE+r21SobD5oMp8MTh4K03h1kQdk5Eer6F/5NU4ajo1nhqRzhvTZeyx
	U3kIYesVffx1VZQXkoAq63uzCw47Kxcr6z1AFW7Zm1IJXRoB/Rd0G9ePInav04Cnt7VrCPAmlwj
	ouiRtzcsGafZ0ePZW0ex31z8xemYewRUKXblT2Lcm0fA6zh6i+fT5BcO2RsIFxfAx0IH7ZtA5UJ
	mwmQ=
X-Received: by 2002:a05:7022:3d12:b0:135:3983:2131 with SMTP id
 a92af1059eb24-136341c8b21mr9992516c88.21.1779921940478; Wed, 27 May 2026
 15:45:40 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 15:45:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 15:45:39 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523010607.CCABC1F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-16-2f0fae496530@google.com> <20260523010607.CCABC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 15:45:39 -0700
X-Gm-Features: AVHnY4LIsg0HNghLgZYcP1TwllMFGycwHKfgPLHe4qjPEhOmdYUpg_w7XPilrVc
Message-ID: <CAEvNRgH21BoKT1mOQzgmKHKpDi4xbwtbMuenGv5U1ZUSENrJmg@mail.gmail.com>
Subject: Re: [PATCH v7 16/42] KVM: guest_memfd: Determine invalidation filter
 from memory attributes
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Use-After-Free of KVM memory slots during guest_memfd invalidati=
on due to missing SRCU read lock.
> --
>
> commit 405f31b1513a8790de48221d335a28b8c5c7bf77
> Author: Ackerley Tng <ackerleytng@google.com>
> KVM: guest_memfd: Determine invalidation filter from memory attributes
>
> This commit updates kvm_gmem_get_invalidate_filter to inspect the memory
> attributes maple tree for a given range. This allows KVM to identify if
> the range contains private pages, shared pages, or both, and set the filt=
er
> bits accordingly.
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index a361b3f672516..4570e90f8c042 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
> [ ... ]
>> @@ -244,7 +256,7 @@ static void kvm_gmem_invalidate_begin(struct inode *=
inode, pgoff_t start,
>>  	enum kvm_gfn_range_filter attr_filter;
>>  	struct gmem_file *f;
>>
>> -	attr_filter =3D kvm_gmem_get_invalidate_filter(inode);
>> +	attr_filter =3D kvm_gmem_get_invalidate_filter(inode, start, end);
>>
>>  	kvm_gmem_for_each_file(f, inode)
>>  		__kvm_gmem_invalidate_begin(f, start, end, attr_filter);
>
> [Severity: High]
> This is a pre-existing issue, but does __kvm_gmem_invalidate_begin() safe=
ly
> access the memory slots when iterating over f->bindings?
>
> In __kvm_gmem_invalidate_begin(), the code iterates over f->bindings usin=
g
> xa_for_each_range(). The retrieved slot pointers are protected by the kvm
> srcu, but the read lock doesn't appear to be held during the iteration:
>
> static void __kvm_gmem_invalidate_begin(...)
> {
> 	...
> 	xa_for_each_range(&f->bindings, index, slot, start, end - 1) {
> 		pgoff_t pgoff =3D slot->gmem.pgoff;
> 	...
>
> When a memory slot is deleted, the code calls kvm_gmem_unbind() and
> kfree(slot) after synchronize_srcu(&kvm->srcu). If the read lock isn't he=
ld,
> could a concurrent memslot deletion free the slot while it is still being
> accessed in this loop?
>

The issue here is between __kvm_gmem_unbind() and
__kvm_gmem_invalidate_begin(). Since f->bindings is protected by
filemap_invalidate_lock(), I'm dividing the analysis into two cases
where accessing slot through f->bindings with and without holding
filemap_invalidate_lock().

## Holding filemap_invalidate_lock()

If unbind happens before invalidate, we have

    filemap_invalidate_lock()
    __kvm_gmem_unbind(), would have removed slot from f->bindings.
    filemap_invalidate_unlock()

    After this, slot can be freed.

    filemap_invalidate_lock()
    __kvm_gmem_invalidate_begin(), which iterates f->bindings and doesn't
       see bound slot.
    filemap_invalidate_unlock()

## Not holding filemap_invalidate_lock()

In kvm_gmem_unbind(), __kvm_gmem_unbind() can be called without taking
the filemap_invalidate_lock() if !file. The only places where NULL is
written to slot->gmem.file is kvm_gmem_release() and __kvm_gmem_unbind()
itself.

kvm_gmem_release() is prevented from racing with kvm_gmem_unbind() since
kvm_gmem_release() holds slots_lock, so since kvm_gmem_unbind() is
called while holding slots_lock, it should either see a guest_memfd
memslot with a file or no slot at all? Perhaps I'm missing something
about get_file_active().

Would like Sean to check my understanding.

> This race might occur when __kvm_gmem_invalidate_begin() is invoked witho=
ut
> holding a file descriptor reference, such as from kvm_gmem_error_folio()
> after a memory failure. If the file descriptor is closed (refcount is 0),
> kvm_gmem_unbind() observes a dead file and skips acquiring the
> filemap_invalidate_lock. This allows concurrent xarray modifications,
> potentially leading to a use-after-free when dereferencing slot->gmem.pgo=
ff.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-gmem-inp=
lace-conversion-v7-0-2f0fae496530@google.com?part=3D16
