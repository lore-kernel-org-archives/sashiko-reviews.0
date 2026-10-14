Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41A502795
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 13:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983032; cv=none; b=WlySG0hQ0O1BnCo0Q4U7GvrM/spa8lU1iOK5FuzsJYxpCT51v0a3aOy/pixjwwAF6547fYfCGAubGqZNzGIbGj2JADsp0h5RjzsjxV55/U4tQtccPHbjMfEjjSByiZOFiUpwoox1+L2/cpxj7hH8lKFbVWnBqM3FmAeMNjTTLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983032; c=relaxed/simple;
	bh=stUaWFjUWKA2F9KXHsSkTF8gPmVnoMOi+831xrj2Fts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEu6EnUs1Blz1AdqPprwH/XVj3PCdeJS0ab189j0DrXUf1CYZVsuTe5wVZXTO7dHuPG/vwOrCOJB2tyoOyM32vphYkzgWiBpHAKyJUFEE2q3PIboxER73z/4dgFw38xDx9vXBfsFnUvXRGBzVGQD1c5hVS9rsdCfvqm3SLFKWb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TotblA+E; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TotblA+E"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso4352150a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983026; x=1792587826; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hySBp28FH7LStZX4dSOECc4b5G1QoNxWR9lw3M8ZY3c=;
        b=TotblA+ELqRYAZ/4AFaTQrNq9rbeW7DWxUZZENAUbrivmSI8lpzEHhHMAC6LqGrf8o
         oFrFmebAC7KSjzRXTLDc8iZ78YR+Mt94g6KM7d1PVeNh7avI9SFVpIzU+uiy9yLYx/BR
         Eg1Yyjnz2CVwXcwzf5ZOrqWjzuQw7C0pUv1vP8hfCFuzDGy4R+ijBl0rLGyq6oWKJciM
         CRPzRHHTZ0jCVuMyqNsSVg6URVvSjICn8adtQVrBw4frGaQ8uZlj6lO4O1eZEA32TSXr
         bHJl415NYTJpzEx11iyYsB3NGnJ16BvGZgfrDiCGXyc+/FF19fOTZ/uWm6OE/wVtQwA0
         q+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983026; x=1792587826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hySBp28FH7LStZX4dSOECc4b5G1QoNxWR9lw3M8ZY3c=;
        b=hOzBfzTd754ZRS6CLVzh3Z5t8LD9bWeJqQTJ7tTKMO+au7Gi8ZaFbJupWTuluoZwW8
         lP7m1CM9Nsy0t3XhAONfVyCCFDvqydSlxrNRIqC4kA6m8vMAZSLzTQ7ANxWxWecnEj6V
         P8TInOB9dDIUMPtnXYnx6bhciUtIZt0o2r0MizILGAmOI1z5r7R6DFZ+k8q+dDCD6DFl
         0rEKkVZpd0vV9Et2DOmRbnR+jYsUqDnAv6GiuShvj6ZdGGdiN5CsIYhJK6NEYzweeYSA
         bpBNmv8V7FWOZhRgOwPBPX1bFfQK0liBVYGgX6UjmMamb+87XW5AEHa9mN8MNfwmSoS1
         I0sA==
X-Gm-Message-State: AFq9FYKfPf5Kf5oFyrz0yrXijz11hei4ICR6AIOa9zzslitRxEIitBRc
	4huxl0AWwtlYz2TT7yG6BdEg8v4xRKMB7SGctiofbRS+vy8rJl8jGBB4CvsiTg==
X-Gm-Gg: AYBFou0u9Y3V1hqv7m+/zDI1sFqsqK2/xF1jIadL2EIzNzK+5Njz8S3q0nK1uTbd8as
	KrVeske04gqw8rdI8cshIEi7iwoOBJDanPlp7O7OjnFtUjn8Z+oP0uvB4e2labtMupySdh8WDLF
	IzmAo0+Pji0YQbDiUz5rH/QY1Pn1rkQhjfxo4YIz1QpndfHx2rLrVQOaKQ1XwTNBJ2/9rugR/dH
	WpKOKPtzLDMsswRtSZLcTqHU9dqoqo3awQH++lnlx0vjNRI0yu87hqrL2e6bfKvdQ717NQkHVgD
	aiMrXto9JoGdeskU+7ChjmvDRcv1EUee0bfoF06DzEZ0q24ZGAjw+EhH1hgCBPOjJcuhwZFlTWM
	7jVNRdYacXzTrUnQfSJR55JBWn/ySLM0C4Tk2XNH9h0u3wg+zTp/Twslm/LCDIpEjx4bvUEMrtZ
	pLIJCMiQnecwVV0gTGcPjfu6/3D9Ci4Bw+t0BGC5hwX5YbRfJ2DCanj71EDhaoDAmIBeOoA1+u1
	kf7gjQjhsQDP7PsBsJl7Wgu9/F2VzIbz25BwFVFD04OwWfDLBKPijachsfsX1dfAaKp17JaZPI+
	kYfNeGCeG9cCMYPmdnrk/lOkr+SCd5LxsjH4TgDdec0LRE0b
X-Received: by 2002:a17:907:3e1e:b0:c2e:411c:c617 with SMTP id a640c23a62f3a-c31a9a0528amr1439559166b.5.1791983025610;
        Wed, 14 Oct 2026 06:03:45 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6ddcsm11570622f8f.52.2026.10.14.06.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:03:44 -0700 (PDT)
Message-ID: <8b834c2b-d8a1-4481-85e3-cbea9784f53e@gmail.com>
Date: Wed, 14 Oct 2026 14:03:43 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/13] block: introduce dma map backed bio type
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
References: <cover.1791975048.git.asml.silence@gmail.com>
 <39b964cf7510f42755188563da63d3d5acaf2aa9.1791975048.git.asml.silence@gmail.com>
 <sashiko-outbox-171194@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <sashiko-outbox-171194@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 12:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] block: type confusion in blk_rq_cur_bytes() due to bio_has_data() including REQ_DMABUF
> --
> 
> commit 338a7d60f029eb7fdd6fca422f1d54a04222c016
> Author: Pavel Begunkov <asml.silence@gmail.com>
> 
> block: introduce dma map backed bio type
> 
> This patch introduces a dma map backed bio type to support pre-mapped
> buffers without requiring a generic bio_vec. It repurposes the bi_io_vec
> space in struct bio to store a dma_buf_io_map when the REQ_DMABUF flag
> is set. It also adds specific splitting logic based on the minimum
> segment size provided by the map.
> 
> [ ... ]
> 
>> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
>> index 98e21b4cbf328..0cc09b975d8ff 100644
>> --- a/include/linux/blk_types.h
>> +++ b/include/linux/blk_types.h
>> @@ -233,7 +233,12 @@ struct bio {
>>   	atomic_t		__bi_remaining;
>>   
>>   	/* The actual vec list, preserved by bio_reset() */
>> -	struct bio_vec		*bi_io_vec;
>> +	union {
>> +		struct bio_vec		*bi_io_vec;
>> +		/* Driver specific dma map, valid IFF REQ_DMABUF is set */
>> +		struct dma_buf_io_map	*bi_dmabuf_map;
>> +	};
>> +
> 
> [Severity: High]
> Does this union introduce type confusion when existing block layer helpers
> check bio_has_data()?
> 
> Because REQ_DMABUF is a flag rather than an operation type, bio_has_data() in
> include/linux/bio.h will still return true for read/write requests carrying
> this flag.
> 
> When a driver partially completes a REQ_DMABUF request, blk_update_request()
> calls blk_rq_cur_bytes() in include/linux/blk-mq.h to verify the size of the
> remaining segment:

IIUC, blk-mq.c doesn't do partial updates with blk_update_request(), and
so that recalc shouldn't be reachable for nvme. Would be good to update,
but should be reasonable to do it a bit later.

> 
> include/linux/blk-mq.h:blk_rq_cur_bytes() {
>      ...
>      if (!bio_has_data(rq->bio))
>          return rq->bio->bi_iter.bi_size;
>      return bio_iovec(rq->bio).bv_len;
> }
> 
> Since bio_has_data() is true, blk_rq_cur_bytes() invokes
> bio_iovec(rq->bio).bv_len. This macro treats the bio->bi_dmabuf_map pointer
> as an array of struct bio_vec, reading bv_len from the overlapping bytes of
> the dma_buf_io_map struct.
> 
> If this garbage value is larger than the remaining blk_rq_bytes(req), it
> corrupts req->__data_len and can trigger out-of-bounds memory access or
> panics when the request resumes. Should bio_has_data() be updated to
> exclude REQ_DMABUF, or is there another way to prevent blk_rq_cur_bytes()
> from blindly dereferencing the dma map as a bio_vec?
> 

-- 
Pavel Begunkov

