Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F861EE7B7
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015226; cv=none; b=MYeJrbt1AdsE5gb1Cc7oaB2RDobRHaVQT0LGUTTy085DHwACcfktzYqcRU/0jtZgXCJw46Y1YR2fRZ1elkSwuMF8Bribl+Ia2aEf7NBofM16ziv1ztgA8AhoEdQrJJzxH5prNnhmn6jBve7ecSDFEadVLKebC0k+YTCpBBgsd2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015226; c=relaxed/simple;
	bh=PiHaEbFbsbuk3xWfpHJf3iZCAXPgh1x3mz6btgM7DeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTie74nuKWrwHl6cnlJ3G4Z+9g92k8sJ8mGGzcewGFxTuY8aaLCRiqeYH1ax5V7O4D75NoEHLB7HwAKVV/EWYQi5m+yg2332W0NXfwQrLwDADaIOaPcxHgwLgyGdMuTewXlzVOjgdVNwt6URsvV4jv72BhqzGYUdGxhGtLQ+fic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M5/RwjCG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M5/RwjCG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so19170905e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786015224; x=1786620024; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iqPDnpSytCdb2l+5MS0mIwH5n9oUyHF76yraGYuJXY=;
        b=M5/RwjCGs9k5IQrSOPgO8jMINsvCRFYp9kAwua+X13F4p7D72B/zYFEQswLjdk+zbU
         wydEqbC2Hf0NEVQ2WZ2C58nSRMNMbf3TPEJEtBUysQdqgrEEnk5mdM9c4dB5oe2JzoEi
         AHHbWvACvxO32cglFI5FWGi5ustA8m5mjVGdCI25OnUN/ej44o3IcVziaQeQKymF6+6e
         VY7ADoys5Ho430fkecuwXlSXKzcFxt0CGtkXqstYZu+ryQuLLDjnksdqzkP7nBL5nGTp
         k4IJrj7cxd3JRgD54wnYWUiDLx1EjpiVorJInhSa8ZiQIXcJuUUwcMbUdpx47m3duL+L
         +JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015224; x=1786620024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iqPDnpSytCdb2l+5MS0mIwH5n9oUyHF76yraGYuJXY=;
        b=TW/x3TwctS7yhfAq/b9VZ7qCsONCmygLEp+c5EpQeIQAduzGtBesTMAhcZW22RYZHD
         oQhujziWH/QT6jptKnoi7l8aKZxFXIi8N+zn8jFh5OiUn3h7CIz0wzK9ERYQmB4n6uOg
         ZfUOb8eSWklGU9x23cVl4KeoWauuToF82GiGkPS3zPCiNcJ+KD58ysfVOVAaulqoUBuU
         hymhKbbKrg2esjlAGLCYHgxbkfg5EyggsTfZ9x8xB9UA74XBfTOrRxCc7Az1symxMqYn
         +UjoN4CTQNiv5Ll0rDT/PkloI+V5UzioeyTFbnvyYRDqKWHS6iP8gEfEWVPIXcDz1UIe
         QkPw==
X-Gm-Message-State: AOJu0YwtH4vAv4wEeJeOBSERhgerkzsiwoXHN5DrqqGoKDfyHcHf5awd
	rE3gp+fSEgtQlojqT1SBF5k8QdZSgdpEFpevYHwHI420nPzMQknkI6kQ5jme/zGkvnCLZIxaSGd
	uaEd1O3I=
X-Gm-Gg: AR+sD13oPlSBb4x2p4/rfEQdzlgxrbeQwjn1+uYhL87BYxvroeb6gpsakfx6epvS4E0
	Ac7Wm7xru+BXv1oi2yazkaHnuuWRiI7qFThSurJ6A6c4+9+v2Glmup2U/Qpo1riKQ3uQpf/Vxbn
	nkI9A5Y/1owYxlG6QkVDN8wfxQxrHEHlxK0ymqIXKHNLOG3GsGJnM28blh1TpsgmK2BbO/euXVV
	KDciIErqDvEhGg4acnSkL/LdyWTh5o4L4HQ4SZ28uHPGuU9EKTHWYrs1TKJ/LmXIXU+l1q2i65k
	hgK8h2t6tn4y3+/dcN2JCeyxnbeteLiITIdMd4DjG8SBG8ju6QCr2ImBtuBc18llNte0z5XsLQ1
	ZZGQwzr3YBQQ7yMI8VWkfyK9gaWvxKRkRId9carEUwJh/a+6+mJiaaVspQerBrg/BXPD8D8P/ZD
	K9jz3VsuhsI8QY8sEWn5O5RSlkxQxheF6AsJlg1yrrliJP7ogJN2VjQNLhqq5qo/ujM+xR4wfgt
	/Rl67qj8AD8yd3ao6PKBHKypBYgCJFjKA/p
X-Received: by 2002:a05:600c:a47:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-4994e71296fmr181515805e9.2.1786015223817;
        Thu, 06 Aug 2026 04:20:23 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499541b525dsm67037675e9.0.2026.08.06.04.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 04:20:23 -0700 (PDT)
Message-ID: <c2075a81-4e2d-417b-a5c0-3909c063591b@suse.com>
Date: Thu, 6 Aug 2026 13:20:23 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] module/dups: Avoid unnecessary kmod_dup_req
 allocations
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org
References: <20260806-module-stats-rcu-v3-0-2b0331106f00@suse.com>
 <20260806-module-stats-rcu-v3-3-2b0331106f00@suse.com>
 <20260806094202.A5A981F000E9@smtp.kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260806094202.A5A981F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/26 11:42 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] A `request_module_nowait()` call can prematurely complete a concurrent `request_module(wait=true)` request, causing synchronous waiters to proceed before the module is actually loaded.

This behavior is intentional.
