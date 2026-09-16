Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407947DF88
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549844; cv=none; b=OD5duWHcOMjED73QX0IehvRjqEQ/lYMmP/nGQauWp6tqaSu9Lo064lgfDsotLyrqvFVG8kBhS4dDOPOcmCLltPKd/lAd+Ana8FHZ8v6+W65N3XTtflZlRO7wO4e6l3khnRvxOgO76yJGpCijsoIg8w250Csh+Jt2JMOOcL3y0j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549844; c=relaxed/simple;
	bh=3m8JJ1UvTsz3BQhYE1mRiTRldZYqLYNhWFgPWZwH3XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7ji9tGG3rTXbFeBiE2VjWum42MPtgGotTB4InJTfEb1QJx+dbLpR4ldwz82PPF9IMrfq86FWRiEwDsG5zHgVLwyaKQYekJFRm5hO6nBEUP3LBYvIM9zRRn/q67Yxj4PkLN57uiLIG1tvofuOXTDVUMhXC3Ior1wJliOG/thayI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+5fRpSA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+5fRpSA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f9bso6238015ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 02:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789549833; x=1790154633; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vRZGld0s5BRieikp7QTZk4DGusz7CwbDabPlhDtn+4=;
        b=T+5fRpSAFLOkjcumLKSzPDQhcKM2d7Fa7PtAg537OihF57Yl9ofrdXkHkgaBkD8YFE
         0oKG6qJ8vhcDmvB/uhpUei4N0nhQ4D4C3chjhogvAud6cZzp/jzmQQq0KjXewzgl2nVr
         48xtzj7naubzdCQzABCoKJAfD0KWgTvSXZJ1wcckMPoZ97LdU2m+27LevhgpNGJe70ii
         iQaLUS+BZlYUj5sP5ZAp6yyNTJH4PCAwAlj4hlKxaew3vUgvuIsohDeHpGdw+osCW1Ls
         Vuz1zmVHHZgXNMdRJHIo9XR4RK8CU32ZQAeHzcEd8pKsN7lNQJlRjIUqE983++YIxMZy
         SMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549833; x=1790154633;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vRZGld0s5BRieikp7QTZk4DGusz7CwbDabPlhDtn+4=;
        b=JfM5BsFK4UlLpvLMfQGAl0gRaK+eM8ou8NNRaOfZRFUYBXJQS4xO1Wi7/DKWIB2x1p
         iC26TsR6DOH6P1sTSWx+5g8JYpcsSnWv8sj22ntL6FzRNwEYaV5kbgcr9qWg/gwl6TJa
         KUd5pjKm/wLo9Gl3xwPt+oJb1i4ATX0oftlK00CJ1yIuO2+t/mBvocZc51wGyN5xUuE2
         uPxL23VM1ZZAC2lH3gxoaiv/rMqt8s2K/2Nf8xDZBRY8Ahh8BfaWcET2Xe5WQEsCauyi
         0LnULyMILs+si36NlZP7JB+CfGeK2gNv2lrg5hcdqWJ5bCX0Tpe//1qNzvcIj3pwLTA+
         TbQg==
X-Forwarded-Encrypted: i=1; AKwUvBxU8kKNFA/O9kmoZpizOBHhudDS3wHt4+bHpgxq6TFfqbGj0CppuBvXSIFsVTCAKzAI5Fbkwihb+8pXYc3Do7c=@lists.linux.dev
X-Gm-Message-State: AFuF++miukmgfyQNpx6qJYyRSwbzBkFzJbjskAm4ibuaAVu1eiUskMlt
	MGAw4/UuArZGWUpA9zrVRXx7iLZV5fCIC3DzcuDs8X7NONVCdKAnNcXQ
X-Gm-Gg: AYBFou19tx+CsL+Tjt4vKBROmTOGYlTeA/CyoqtiW7oYvJP+yHwkwwvHvK7YPyUkCxN
	eeqP9dt00F/ORiaNqM1UTz5QWZ8bqpo0+ql1Xq+9ohQpLQikDoXnQ0KIXNPKO2HKiRoCCAWeW8X
	7SuFSEvT1fRO6agBDBNnrCh9RpNZqCF3YEC7KnDTc65uDyYMz0Qu/p/eCDf98+yEmwS9GR04tfX
	poHk9qmykiyll3gxCSWS9M360QH81Kf/q0evd902XexfdNwvRgB8xt+nUbSGK3SxXo3ed2jR46e
	EAeaxe7HDF4h+IKktTc6SRVJZWhCGL2+0LmhmOmTWSzQ3U1pHlSSkPrhj4UAlz9X0pTRPO7MEDp
	K1OGzyED1aLEK/fIxWbZKMM25cdcFhunbCaJt8e+UaC0hc70Xrncg/oJsIfY1sYSSsBMrcJYQjJ
	JBBO0TsNHqTJ4kAT+DUSUmHy0ZPVRx/KQfPQNr1x91fljWY3WlyPnJZKh8bvx7fg4J8KmJk57I4
	tt/1WaE4YzqxOS64w61UAhP059H5McaziDPO7yj9eTWkObn
X-Received: by 2002:a17:902:d2c1:b0:2dd:6665:9ff7 with SMTP id d9443c01a7336-2dd8e7b8854mr35937705ad.22.1789549833094;
        Wed, 16 Sep 2026 02:10:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5af6593sm5966813eec.25.2026.09.16.02.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:10:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ad0db51e-ae83-445c-b604-f445138204ae@roeck-us.net>
Date: Wed, 16 Sep 2026 02:10:31 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: msc313e: Propagate error code in resume()
To: Tzung-Bi Shih <tzungbi@kernel.org>,
 Triet Hoang <triet.hoang.dev@gmail.com>
Cc: sashiko-bot@kernel.org, linux-watchdog@vger.kernel.org,
 sashiko-reviews@lists.linux.dev
References: <20260912164221.966851F00893@smtp.kernel.org>
 <20260916044557.74124-1-triet.hoang.dev@gmail.com>
 <aqpA4xln77xgBjs9@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aqpA4xln77xgBjs9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 00:10, Tzung-Bi Shih wrote:
> On Wed, Sep 16, 2026 at 11:45:57AM +0700, Triet Hoang wrote:
>> Sat, 12 Sep 2026 16:42:21 +0000 Sashiko wrote:
>>
>>> [Severity: High]
>>> This is a pre-existing issue, but does leaving the watchdog framework state
>>> flags intact when the clock fails to enable cause a system crash?
>>>
>>> If msc313e_wdt_start() fails, the clock remains disabled, but WDOG_ACTIVE
>>> and WDOG_HW_RUNNING are still set. The Linux PM core ignores device resume
>>> errors and proceeds with system resume.
> 
> Another example that Sashiko complains either way.  See also v2 [1].
> 
> [1] https://lore.kernel.org/all/20260828162703.9F9DF1F00A3E@smtp.kernel.org
> 

I'll just take v3. If the watchdog fails to start there isn't much we can do
anyway, so we should not bother too much about it.

Guenter

