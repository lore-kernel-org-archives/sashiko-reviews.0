Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2B33F8A6
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068537; cv=none; b=bUJWPzJF4TCxA6i5Hu2knN5lGrZniCMv6IcP27ZDSqyBson97KMTV0zSjZdYg4SUoiZ86L7HsuVNGK0GDgqUJWs1s861TR5dzbPAWsQFIMv4GUSSr/eHgANbWg3iwS0EUIg2pBWwuay9RryVdkDXvxP532NuRa4UZ8pyb+1ACmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068537; c=relaxed/simple;
	bh=t1f78knh12ZmqRiDQZWvjRMn+PPvWWmkItCJFVyRIUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjsMpBSrahCRdhJuTM+Q0NTIfm1iKu+CZogDnKbZSVmr8u96AbXXRCabSnwtxBq+NNY48lcepp+FWSLVCuDKzTV9dZKaaFQvwi1IGSyxVw8AtCRCab83Yi4yUP5iix6t9zoPneho+10Tm2lzdiIlUufwrjvboXzD0h/IxDXIEdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQlYOkuG; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQlYOkuG"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso5281834a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 02:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068533; x=1790673333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVBUhiCaUFlUB01ShpltKkED8p1NxLCtsXyWQV2+EPo=;
        b=YQlYOkuGh3DIEuz0W+0LLTUcelt5DRUHWfUKiA3iUYAC/GMEmhxt58+cyDoO6/UCec
         Gb6iJwAsyOjlmQG9d0mKz3n9ozPMKs/G1EGsgODKNiujq0k2PGVsR7FIPQUL1MxXymz6
         /kVw286sWgCF/NFAEml2IOb8N5+b9JEOxAXWa97/U8SS7FUIhCIi62ZrO6yIeGpTKKvB
         VFFnTAVYl+es/bE4II34JPHoaxKqFU9nnHeB0mbijyGCjHRX8XhkYF4ornW4Uz/FyFu3
         h8DxH+6+VLEp9DYP/ni2TwxtBwyK92PISk13xLEp1R81XbIwfGyP0Qajh5LB3nGmw14L
         6z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068533; x=1790673333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVBUhiCaUFlUB01ShpltKkED8p1NxLCtsXyWQV2+EPo=;
        b=GiWEXNkUcq5/Wrblmtx1Wb0iCmn35eDWDE770ygNM66ZW1OimDlYDb7XDhEa3+HtKP
         v1YMwsMFJcvg4gx+gFk/nbR2PSEYJf+hNeUSTYPrkoOV00RuDUNYGjxydqRy+3TujIfo
         dOMkmjonBw78mlbPVRGyHd4jI00yTSmoDZ0D4qnh6AGyabkzNCRbxFv+7+RjyxRUEve4
         TWSHEF5K4JPfccgUGqouoPLG/ZdD03+w0vncM+WXKzgbByid5cxcDIbNGRfXJofGVka0
         LHtCGu8nnoYronXOO5f4MGrtTGUOtW6ft7xis5oynXRuziBQyiabqADbGzNoAC3hXXCg
         n3vw==
X-Gm-Message-State: AFuF++nNRZHqw9HwVVKGajhpW6Mh79ZTMLZrGe7n1YE2syCh1zry+Yms
	K365JwJTDaNVbX3YfaW1VK1SB1KiuB+rme35Rrzan+DexCmROLxG6lvBdQbt5Q==
X-Gm-Gg: AYBFou23eniPf6zjNwOPbTEzZBcVNq21rcGR02AsgLywkmvsfLApxe5KDrXbXRdg2MW
	BKv6Lcxv4dXxHSwwpDYFTgzs6QSFRDinwl8GNsr7nd+i4wGwCNIkH86fSfGpdoyFtYQs7SCMgk/
	1JksTNb+DToGq/UmdbburXAg/wEau3oRR6XTaGuVuAkI7tz09ED7TlEo2RLw9QF/F+Vg+TIWvkZ
	7/zsuYvhDArTYvfq/aOoKoedYVvfw1FCZQmDtMhET0a9uVZfgBrM6dZv8jk3eOCRB4KtAc6hoUU
	T5NE2caujxxXvM0ExQzHIqNVYVmZ6px3REkdV7KRCghdfFYnHitrNLmcsORrUrn213r/l3TYd/F
	xFoB6BkXFn4D3j3XbSUsTUywudEY6sU5u4Fjh2Zd0jlWhJG65HfU6JvPtFQ1ZqNEmpM1d9x8WrG
	rYZM6DUqa4a5mbivcx/WgIPSbnIc43lAwDKhSWW7jI0yjTzzG4FTcHAO8tAQRZT/URFTU+W0dvv
	S3bw9migzHHSLseaPu+hLhX/W4zuLCpgbeI59vAhRRaX+6PPamwoyfI23yc9O2yMEgJKgQnF2i3
	berhzGyp/jJOJBbKt9/Juo3IMksItcCP5YL6H7X4S0aPVXIH
X-Received: by 2002:a05:6402:4145:b0:6a9:9766:59ad with SMTP id 4fb4d7f45d1cf-6aa548d810emr11873729a12.43.1790068533059;
        Tue, 22 Sep 2026 02:15:33 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaaae6982csm35272a12.22.2026.09.22.02.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:15:32 -0700 (PDT)
Message-ID: <3585660a-f15e-4b4c-903b-d7d75448ce4b@gmail.com>
Date: Tue, 22 Sep 2026 10:15:29 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/13] iov_iter: add iterator type for dmabuf maps
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
References: <cover.1789997898.git.asml.silence@gmail.com>
 <6b78003332b57ec3a4552d7393464636793aff76.1789997898.git.asml.silence@gmail.com>
 <20260921135338.241751F000FF@smtp.kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260921135338.241751F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 14:53, sashiko-bot@kernel.org wrote:
...>> +void iov_iter_dmabuf_map(struct iov_iter *i, unsigned int direction,
>> +			 struct dma_buf_io_map *map,
>> +			 loff_t off, size_t count)
>> +{
>> +	WARN_ON(direction & ~(READ | WRITE));
>> +	*i = (struct iov_iter){
>> +		.iter_type = ITER_DMABUF_MAP,
>> +		.data_source = direction,
>> +		.dmabuf_map = map,
>> +		.count = count,
>> +		.iov_offset = off,
>> +	};
>> +}
> 
> [Severity: Medium]
> Since iov_offset is initialized here to the absolute starting offset (off)
> rather than a relative zero, does this cause an issue with the tracking
> logic in iov_iter_revert()?

It is relative to the buffer. No clue why it thinks it's absolute,
but this unroll looks fine.

> In iov_iter_revert(), the unroll size is checked against i->iov_offset
> like this:
> 
> 	if (unroll <= i->iov_offset) {
> 		i->iov_offset -= unroll;
> 		return;
> 	}
> 
> Because iov_offset starts at the absolute offset rather than 0, couldn't a
> caller successfully revert an ITER_DMABUF_MAP iterator beyond its initial
> starting offset? This would bypass the BUG() safety net intended to catch
> invalid unrolls, potentially leading to an out-of-bounds DMA access if the
> reverted iterator is used again.


-- 
Pavel Begunkov

