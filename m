Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E9370D70
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432899; cv=pass; b=eb/nFMDh7LGEgmWNwWnxKCazzrz61obU8ljqUqFXWrDJ5mkHVKCnV+2Ex6wkubbr/+mYNqpQK1wQ0ynf2/4d9LIxiWlmND+mwWNuzf00TuLgzPwgbKh1Nd13G4WT0I3lW5DxZ9clJQBQmZF56sSn6T9IQyVyqpoTR+23tDw5cLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432899; c=relaxed/simple;
	bh=nTYPsQanuHPOf3+YdCHnJYoAoqYTW65WA3kXZLPmJs8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4Sa4JOIHl4udW9rKJpscAFzSN42Okc6eRQupS9ysmfgf0oZBVwFrp3AtOUmO08uYNvz4xa1kQjg7iW2igmnXMJWvOJXtl6QZtXKV8DQ0YPYKSkp8bZF7K0pRLjfEkIk4rDkyYWNsLZ4zAtivLGxy1p+u9lLFr4nBDd2vklnQps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n6vFnYhm; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n6vFnYhm"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137dd51129bso627380c88.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 13:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780432898; cv=none;
        d=google.com; s=arc-20240605;
        b=JmQ/W3c2+o66un0IDOLWBEGYLv9tmkKukpcSlg7IwyuFzZkVsILKPMGd2vVof5VJ7w
         Y+jmnuvYla+0+zfJl0I2q9ugwAwP3SdraZGTV5GHvwkKEC6utNOsX9LFfWOmEYdqRUZ9
         rAKgd+EUdD5FolPQ/05ILWDRuD7j7DMrM4QmNymadpF9ZqNBWRb7Er2NdDqtp2IYNd8B
         ZeRJ+yGZwrwoDS82F7lAuei3T7bczua4kAR2gr/6tX6udGQecYCWgmV5SCRUtpmfjV7M
         2NmtEaWmhIiLHSO/2Hn1e7AAj5vncq8IxDSObYZF8w+BiJPIwq5d5834/m+ObuAc2KDg
         O1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=Q9DfpYFNGzsB6sazPDXo4YOkWRxIbqoOx7DhukB8QIE=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=ZhgGjnguZ5tnr2zuOnZHjTbMgx/TYhiYEOHzAt9iqChDqRNSiErZV3+uJ7tvM2Nhzq
         u5mFdGdK/0aLZk6+4E4U7OmKVXo5bm60hDQcGbry7qsxWwDE65fNJqVdfX2HwTPjJtU9
         uqW1jIJJ3uvBGgsrxDcl29E/JzQUKP6/TNEPdPLYV6aMsl0O/GdjDDlDcx6I6InzNxKS
         dDx+9pvNKV4OtWuoRMwWi/8XSMJY5NNulaagwqADL12UpKfsBLP5VYl5XlQv2pQwLQkM
         NYMUeqE0nm3TVeD4fELyF81JMfQ3245YZmiV+/OFdnugQf0SgCfb82X8ejIUXOajHdwY
         RbCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780432898; x=1781037698; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9DfpYFNGzsB6sazPDXo4YOkWRxIbqoOx7DhukB8QIE=;
        b=n6vFnYhmK9Ldy+/18gNAOs3V2g8/ENubWJQHPAJZoGBOth5YX+KLEsgGaCD+WUyudm
         kawLYcwdof2uNlhmUNrwEPO0bN1YnYUmOHwW20MkVZlUb29oHyN4dm1MKNQkocKnt3UP
         SehplLCDCEOrYvk1UFfDCvEKcyWSZdF38j35rGIQG2rvruTsMtjwMxdqeq7HMjLW/FYl
         /0CiSbrqaYtYsN8DvX4CLqfW3l/PKVIRZlc+MiXPCgutGI2SXjO9YdYmF4iZfwCcQiJK
         4Ix7AuvpDnkCgXYreHVIn/lwGxmCT8p2W/jlDWQCiHtlJGO6kSOb/XMbXDJCg1/WTD9e
         0eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780432898; x=1781037698;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9DfpYFNGzsB6sazPDXo4YOkWRxIbqoOx7DhukB8QIE=;
        b=FCge10up/wO+X3jO+ncpEwtMOZTluu8x5HL4JWbgSDJYdbOb0MNrEi0hmXiqu+jj18
         nVNFoIwVYt4bDzGlXfUp5KiX+W2A8Pos3HmQAwxfNBsJKMd3dikcTqGiTKcl4oJ8k1Ej
         e/tX0C0MpUiS53SLEL/rcyYlvtWbjjRp4MpvMiZaHzFdyuRNoze2SKpUF4dcFG4VRL2E
         qutUjIftT5mlRQwttene7EbpDKZ4lfa6ZIr7EtNpvWp3cGzPmL8XMF1Q8MTEeXPaghL5
         8G1/igQV+X7g9b9DIlK/0ott0WaGnxgT5hqakLrdjni44YM05nfLAl6JeRa3lOZq5RaW
         z1XA==
X-Gm-Message-State: AOJu0YyeU1RowS4QjdYAoZaAF8GUEmhduQy7/u8OGgGU6XCEZ2VRB5di
	7rhNZBXRf2+Gfw29KX8VWjMK+Rr55NY7/ZQzkz3CLBKGbhMMkmYHiQS/QlYQjWT8D/vWx7TOgOQ
	WX7YYtd0d6Nx69n8ORgKfrF813gAno5JHR+nEx39qycKk9prq1zlVDnyR
X-Gm-Gg: Acq92OF3F/HGZW84lqv9lGtCo1E5W9PoFsiiZ+XeVhCYO/8P6Tqh4hPY+iP8U/pOp7v
	RIYGa/+h775MYjdm/zvo9yacklBFHctBU7PspWYVEJYsiHMH3pjjCYqTsEXvsSk6uXVx4Z+PM4Q
	Mg8SZ+XoP5IYwWApYIrXgB2FIjgrUCStwkAPUKGaMNnAu5b3MTf4nHP9NsxNBkeGPar1TbZ7Ro+
	JzU9baZUeXP55/xrbq4frp0yK7D6mg/7R2mQe8/w+ARFE/hH4jFuNaxRvU2ZA+hFedp4raq2yqg
	DqOiy5GlmJJoQS9wH2fgGIUajTaZCPt0P056ZGNoQfTXO5hwRcQl9Oy29vset5HxWgktP1FE5bk
	q72ST
X-Received: by 2002:a05:701b:2058:20b0:137:eb26:117 with SMTP id
 a92af1059eb24-137f6b87c7fmr108819c88.13.1780432897006; Tue, 02 Jun 2026
 13:41:37 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 13:41:36 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 13:41:36 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523005223.5B9651F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com> <20260523005223.5B9651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 2 Jun 2026 13:41:36 -0700
X-Gm-Features: AVHnY4I-p28f6R-pwlANnTjmbkkEzzn4cv_rflApgLZ-buk8YP2KDCX9f8QQ2KQ
Message-ID: <CAEvNRgHn44ASMxyBpDWXYO0QiGi1PgREUWfopgdk_aQ7bFx_UQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

>
> [...snip...]
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

guest_memfd only supports 4K folios now. I'll fix these when I get to
huge pages.

> While comments in kvm_gmem_prepare_folio() state that the code is ready
> for huge folios, silently leaving tail pages uninitialized could lead to =
a
> severe information leak once mapped into the guest.
>

It's actually not quite ready, but I think this series is big enough as
it is, I'd like to defer the hugepage stuff to other series.

>> -	r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>> +	if (kvm_gmem_is_private_mem(inode, index))
>> +		r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>>
>>  	folio_unlock(folio);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-gmem-inp=
lace-conversion-v7-0-2f0fae496530@google.com?part=3D7
