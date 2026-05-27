Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790893B2FF6
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 21:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779916963; cv=pass; b=njWzkpfvzNKDI6w2EzmE8NXq6bjDdk8yw+RnZVA7OcNGlBWTcsOpYcMbOgxbpovu+aXvXFEKxOdTBgutYR0PZqnQpr6qnUzJSe5wxc8PvOsHi9oEPrMdalGOPRdGJtWK1P8w428R5kL1CVj7LojsJc6SABxGZqhaoMlv6BWUEzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779916963; c=relaxed/simple;
	bh=XvYGqqEvBlv6YcdQYQQO/+p9qmdUFcIrokRBwG38fdM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITPTZ4Cj+cO2scGedQXRnKOIwr5EKKx4mAIKKxYL7C4s/m+LXjKgrCcIT+60jBenm2hPcjt87CEeAidZ1yTTDLyZ+0RbVtwWsMo3s+HyMrg205SCJBeZR76DFrEBKk2ieEReT1sozBCu6dnWR/DIOyvlAEc++PycRGxlrTGt0Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iyKMiBFG; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iyKMiBFG"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1331e851faaso6615094c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 14:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779916962; cv=none;
        d=google.com; s=arc-20240605;
        b=VIBbXu9FBYWQdJfEuHFx9CRw0szOC2lvTYEXMYtc5yTM3WkkvKIxXD7P1Xvz4CWYrM
         KJJZlEVO/638wcoG9b1VJBGicLzeYblMLZOVmoCwyIj53M+wl7L4rxxW6eXk/EsYGAAt
         LC+9mDGdGCL9uRAaw4FFudpvJymW/RIrJhzbGza0esM+wTLCO8/KzppNCbTpZ10JEEkU
         6+pnXzGqHXTdE4wFODCtdMYEUMeLuTL72HZvftZv+bZbjvGyOiziRoedL0kb0YW46J2l
         obJkTugHv7DctCw1poSsnn0ce1/ZPxIU0Mkfx/2uIpySIW07wpU9uYnLWKTWq4nhH4ZX
         BbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=MqRrWniySfNgETbgp2UzJpDVVwuL7fhZGroChWwpnhI=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=NHWUa6cxylYpPYhk3504yk+uMGVadt65nTGOpxoiV4rAKMxcq/3uLObfMkFxs2P7uH
         kzk8CQtonsret45fU9+wHBj/EDySH2UF122SNrkKHVPTe2UXrvyYE7fRKzfW/+HurSP/
         TRBXTROJslj8R9TE5esbQ1XWfdEeM1HxNk7+Fb97twYkXb2PWpdd1GpClJAo81vXwvZo
         UROC8nrbmVIx5pj9Orq9bucOQa9evRJvSP3Tbe2Bh6F3v6BWEnBNn2bHFcw0D5oEL+RV
         /07ub5e2hrz601J3yPl6XbDi+3rPnAkTpysOcsGn1FWC5qAuRwbq3hHPJ/nAaPL5ZRpo
         P9yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779916962; x=1780521762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqRrWniySfNgETbgp2UzJpDVVwuL7fhZGroChWwpnhI=;
        b=iyKMiBFGYxDx9YjD1yz68/HLcGTHIjL/9uF8UGyq5MTyA74T/hUTpVqFKIFqY0vIPx
         kb55Net6op/vuqOlEGPFkcPgG85CDWQ/s70GabqQkDf17girt5nEVhrBVwj4y9GJe1F5
         iKTAWmU8MJvPIA8StgaSTUhhcznTVvQQcZJUL98IQGH/RHa/LuHSYkngfp4jzyYcwaI+
         5bOrPsr/5eSMFBG6PpZ4ipA+lzLjNLDG6oun3ddQT4bau8HbuUu2TCeFlPPm/3rTwDDk
         GyVRCWzCGnRCYsi2Qbtwkey0vl5cKmBrbrDCQAUEnYlaxjuvlYEbP7vLrSeYnJFDGKQP
         OpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779916962; x=1780521762;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqRrWniySfNgETbgp2UzJpDVVwuL7fhZGroChWwpnhI=;
        b=o3Muepq9E7sqdj8FezKIyjnPZkcVf8N5wLCX3PumZ202ndp3ti8jpm2OaYrsCT4mIU
         D0eJnkxZqGTtwwhuMHe/dkfKTXZYFHJi8by3C8QOlP5pyTbhTTRyR6q0SYlx3707JhFF
         MxfZdvEoODiZQLbbHmQHXmiLCSjWTJkqWkDOlr7Ebdwc4UgFV/QBtkRmbHvg5OucQzAW
         uNnfcn33M9nt/e5da5xAHCsjHk7FAM8wgspZl0NLL2rBSR0YuBB6Vu0e4pb/MUWx0tHE
         TfNg7N7XOcHbnP6Zqx76XJMuBiu867rZK3UBVDkpom3fYxQpbgXOcOcogGQ5I/ujan/l
         TIjg==
X-Gm-Message-State: AOJu0YzRZiZ7pfSDuK6ujkincvvFUcrQbQWkkc5BuwQr0xSoVrg1AXo7
	6conBWodiP49YCZjQa1UBoNQ5T+4xMiJLpSCdvUlmyMjFc2yf2vvVZ4fk5ZFW3D4neNHBL1TFyf
	FAkYVx84vQZkoRVv3/BCxjD2GdkqMAJXjxQNQla4NpOLicI8NQ3kVm4NiZ3g=
X-Gm-Gg: Acq92OFZlkD3hhuVDfGoEtq8Pe4+Z8kYVtqGhftHByp6gz5oDQLnv0A5Bv8NS6LXTKi
	tpaZ9aXBjKRAGfIFou4BW6YpCN5G0PqW4PSx/JaR7+0c7+fl1BlpjQ/Amfe7PXqldQfBe1qtci2
	mUO2LbIiG4WHM8BfvFQLvYT1YckdOsNE49+vH1uYeEXh3KeVg/5K/MuYdrXpOhUtJ2xO9q4GlAi
	9/3Hc5vtQn/C9roGQ8Rx3YGl/DXseML6UQ8jxePpl1RSQQwaw2+G3jELMOOnW1HYHZ2W0SXGzCd
	RZyWOOAEX6fQOdpfGvB2Z0bEI3T9Nb2pOJ+YXfbfgdPcs/blXjqDewBRd/odBU5S0RomzL/CUr8
	6WQA=
X-Received: by 2002:a05:7022:1001:b0:136:4e2c:95a2 with SMTP id
 a92af1059eb24-13660b31dabmr6655425c88.0.1779916960937; Wed, 27 May 2026
 14:22:40 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 14:22:40 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 14:22:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523005223.5B9651F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com> <20260523005223.5B9651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 14:22:40 -0700
X-Gm-Features: AVHnY4IfsDU9jpMtFJKqZ3ZHdzH1mupxosrfwxX5_x8ImA5PvpS6zA3RdodDL28
Message-ID: <CAEvNRgFcJ8t=rxHAcGPmaJmQPpqHMCJ-edZ5CFqaF3+kMC+-ug@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
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
> - [High] When initializing a newly allocated folio, only the first page i=
s zeroed, which will leak uninitialized host memory to the guest if the fol=
io is a large folio.
> --
>
> commit fd652f7fefc49fa2d4a303f4d6cbb5c2dad23874
> Author: Ackerley Tng <ackerleytng@google.com>
>
> KVM: guest_memfd: Only prepare folios for private pages
>
> This commit restricts folio preparation in kvm_gmem_get_pfn() to private
> pages. This handles future scenarios where the fault handler might call
> kvm_gmem_get_pfn() on a shared folio for a CoCo VM. Preparation is also
> properly undone on freeing or conversion to shared memory.
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 9d025f518c025..4f7c4824c3a45 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>
> [ ... ]
>
>> @@ -908,7 +910,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_mem=
ory_slot *slot,
>>  		folio_mark_uptodate(folio);
>>  	}
>>
>
> [Severity: High]
> This is a pre-existing issue, but does clear_highpage() fully initialize =
the
> folio if it is a large folio?
>
> Just above this diff context in kvm_gmem_get_pfn(), the code clears the
> newly allocated folio:
>
> 	if (!folio_test_uptodate(folio)) {
> 		clear_highpage(folio_page(folio, 0));
> 		folio_mark_uptodate(folio);
> 	}
>
> Since clear_highpage() only clears a single PAGE_SIZE page, won't this le=
ak
> uninitialized host memory in the tail pages if __kvm_gmem_get_pfn() retur=
ns
> a higher-order folio?
>

For now, guest_memfd only handles PAGE_SIZE folios. Let's tackle this
when guest_memfd supports huge pages.

> While comments in kvm_gmem_prepare_folio() state that the code is ready
> for huge folios, silently leaving tail pages uninitialized could lead to =
a
> severe information leak once mapped into the guest.
>

Support for huge pages is limited right now.

>> -	r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>> +	if (kvm_gmem_is_private_mem(inode, index))
>> +		r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>>
>>  	folio_unlock(folio);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-gmem-inp=
lace-conversion-v7-0-2f0fae496530@google.com?part=3D7
