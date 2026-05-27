Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071F221723
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 21:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779917299; cv=pass; b=UFrSJLTfHMRCW/cZMS5mj6NvnHmF3CyOfUIUgR8mabhLI/tmAYp3j3NnQQAi56Ko4jI0bsZ/1IU5gmQMRZQFJq8l2eeu/gxvoo99PI5VgFDWX79aIMcA//3nFXfZWVHjy5OrB6iK/EhlRM+PvT4JSO4p+klm+vLXgtZJaU85m2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779917299; c=relaxed/simple;
	bh=a0SzG0MQbS2sQaqX/jQVnOmluG6OP++OsMAFA5gVs9c=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWoWBHuRDpIIcM5OA9e+MpjAok1ZqHSiiUU8zawvfiPJnYLLt/62TD264izVi+igNJxAnXIp1V6A26xTB33Z1KALAB9LDqlulRO0hjfHObGP5iz3NYQ6zioXE5LT5RdCnz/BCjpGWFaA8zHS8HhDrgJDw2Y0hrixYPN+zP68ycY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ei+YZyCR; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ei+YZyCR"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-132d1b2519eso7097791c88.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 14:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779917298; cv=none;
        d=google.com; s=arc-20240605;
        b=JJ8VcAytPjXkTIYlQOd2zVmKJcVXc/mOfPiPpJxcpUng1HYSR96oG7V5xOY4CfBhKa
         EPtdzukuQpiKEgIW+Yl2S1ZXVueN750Y22ZOpwGMaSNKwGN8NdeJeVLqPofzaHeKukd7
         MoIiTSmf2l+Col03XozLJoflWd4rpIlZBDJylgxEMXH7xjsXt8zqevonSmEaiCWRwhY1
         OP3LFq/XzMa3z4bc1Ys9KjL1yySHPjAV7uys+YASl/tM46GN403TQT8uwdyfz95FxpH/
         ETCdX+8Cw6Nvp2EI8feBFPGy24N85mcDcry20N+k13VroO2Z670gsKYQvCuby9rAgo39
         Nzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=zdx5eXL6qL7cVTt6BBf4BlAi4V8PYwGAQ+sz/s4x+AQ=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=E6K9cb4Mxc60zcUIln9nsWrO1smbHxhvBvl0TsEBWlgH6XgaK/72muS3RYeAMw8Rbn
         JpMyGD9FiJRMeZQPzaFlV3nV+ZxkbNBG/uk8Y7fyq5OMGIcYUQgzOhqks7Pu/WsrxVys
         9ZGxtBBB4HF2B4x5bqnO/1eewdFywnhVFQhkr6U+MfVtuClxEGfzCokJFyEFLBkH+W5K
         JizjD5SXWbqEL8EspC2Ujp/Qgi7NqPnXiFf4iL49Y6p4Kwoe+gqDQwGHR/ySq6s8+vO1
         MDnX7HxV28f4pXRNhu1rWj6bNAhtgHTA1Jyi8adwQvpDLR6KDydEpbWu8rio9fjE36Bl
         VzSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779917298; x=1780522098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdx5eXL6qL7cVTt6BBf4BlAi4V8PYwGAQ+sz/s4x+AQ=;
        b=ei+YZyCR4BR9ouhFlh+lkBXOS44SD+OfTLIhaQLvKYNGP1oR2Hfmwn3k86PBN23bFj
         s2oVGEfwAOd7aA1H5cZdYk4Q8KikeLk7puWwF9eX/PEKz/Xog9pY7LJ9oykFkguS0Jb1
         ie4P+mT6e0ted02P0iS5wtpT9mT+QOcdHR8GakT8EKi6SL8AsUYO7U3pBXcqAlpHr/0c
         dXzDZ0d9YnlRw0K/serCYe1mZDq7JNR2fus0856XFJkHDNR+0l9kW2epkqZH1+dSBzpS
         znYoksv415RWg6RZpUn3WKEgVQ1oMBtWEJvrl3YkJisilwWES8H7NEkiPjbB8Y+S8mmY
         Cnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779917298; x=1780522098;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdx5eXL6qL7cVTt6BBf4BlAi4V8PYwGAQ+sz/s4x+AQ=;
        b=egYOrky59Bt+C2+MXpKO+wb5EWCyqIhXjN3fUVVCeRh+xcXEuC+o73l8QF0WL51a+6
         WIkaJHmqhq5VoteDJ+B1Ct/fDbsmc1ry2vMbKwRdQb/8vKc4StsoO2RAbpkgYXhePy24
         xQBAwLWVJZTz4LEKg7QR3vITRxKfJn3xrZe6z73a7StZNRkGTQ0Ho4nn9lJ+jNRxHAF1
         QT+0aBWS38WittTPdOU1FMujip8c+QubV2e7b6BeX/jY+r94Ct1d/hpXKTEQGBtODORB
         Tj1h5VR/je4OMtPOtGEmyj2d0PO8pG/TZo2lTajATmnqF9mPdCj+X2A8HOd1QtQ6akRW
         j4HQ==
X-Gm-Message-State: AOJu0YwR6P0Z6Be13kfTcvAgqGZzQjQhDTjifNBGoZoAphnBSsCfwB4E
	0P3FOZ6RfXpt7ecYT2b3zdtCn8/vutuUUs6QlkDp97O6vbHKelPvw51ugAo4HneCshbd69GmJYh
	CSNgn70eZLZbTm0Dy1R0Kzaa+eoDmx+LV/iGKd/a2i+x83RNI2e0Bj8ThBfY=
X-Gm-Gg: Acq92OGeo22YV5B1aHJtqV0UWYd3QU0hYmrAtfZ7kRxSMXI8cLSF2X9YrLi1V3q1XeF
	lTCGKaSYzinYnbnA/QppVXYryd1LILyVQRnABuHLOSomt/JigQVvwZN2SETeU3ZtZsTsv0wOEh9
	WynbyrSund5t9kzm6AlsrrJwhGAzMtHaOkmTMp+TW2Jll3R9WG4fZcVKSSezIAxQdLwG1dV2e45
	+x/b/O7ZEsfXAtH4Lfxk6V3ynD1i3h9pEzYPL4t7HFXCjE31WNTxmH+sH6Zt26Z5ilXY0LQAubv
	UN+GinAIwgLmKzfurcu6n2cQxhvEuLyt+5cX44hLQKrlVRbH7y6J3bfN65/1PrTPKIMJCLeAXPv
	0cag=
X-Received: by 2002:a05:7022:6629:b0:136:b8ca:e58a with SMTP id
 a92af1059eb24-136b8cae77emr6842627c88.20.1779917296897; Wed, 27 May 2026
 14:28:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 14:28:16 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 14:28:16 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523005558.BF1581F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-10-2f0fae496530@google.com> <20260523005558.BF1581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 14:28:16 -0700
X-Gm-Features: AVHnY4LLV5lPMeiEw2ty46ZWdsqSl4F90gDfEAfF0EGpnWud9wi7tfH7Cpi9rfo
Message-ID: <CAEvNRgHXWewsjA+y=4sT11rq27TNVFm82zoszwyBa8AMrs-tHA@mail.gmail.com>
Subject: Re: [PATCH v7 10/42] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

>
> [...snip...]
>
>> +static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_=
t start,
>> +					    size_t nr_pages, pgoff_t *err_index)
>> +{
>> +	struct address_space *mapping =3D inode->i_mapping;
>> +	const int filemap_get_folios_refcount =3D 1;
>> +	pgoff_t last =3D start + nr_pages - 1;
>> +	struct folio_batch fbatch;
>> +	bool safe =3D true;
>> +	pgoff_t next;
>> +	int i;
>> +
>> +	folio_batch_init(&fbatch);
>> +
>> +	next =3D start;
>> +	while (safe && filemap_get_folios(mapping, &next, last, &fbatch)) {
>> +
>> +		for (i =3D 0; i < folio_batch_count(&fbatch); ++i) {
>> +			struct folio *folio =3D fbatch.folios[i];
>> +
>> +			if (folio_ref_count(folio) !=3D
>> +			    folio_nr_pages(folio) + filemap_get_folios_refcount) {
>
> [Severity: Medium]
> When folios are allocated and added to the page cache, they are also plac=
ed
> into a per-CPU LRU batch, which holds a transient reference on the folio.
>
> Since this code doesn't drain these LRU batches via lru_add_drain_all()
> before checking folio_ref_count(), could this cause spurious -EAGAIN
> failures?
>
> If userspace retries the ioctl in a tight loop on the same CPU, is there =
a
> risk that the LRU batch might never be preempted or drained, resulting in=
 an
> infinite livelock?
>
> Note that this issue is explicitly fixed later in the patch series by com=
mit
> "KVM: guest_memfd: Handle lru_add fbatch refcounts during conversion safe=
ty
> check".
>

Yup, it's fixed later.

>> +				safe =3D false;
>> +				*err_index =3D max(start, folio->index);
>> +				break;
>> +			}
>> +		}
>> +
>> +		folio_batch_release(&fbatch);
>> +		cond_resched();
>> +	}
>> +
>> +	return safe;
>> +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-gmem-inp=
lace-conversion-v7-0-2f0fae496530@google.com?part=3D10
