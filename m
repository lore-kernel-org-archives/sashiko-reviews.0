Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68311361641
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958792; cv=none; b=Ax/j3ZlJBEEqsReGBSX0gC9cblXKkEkAmR4yXc8vu2GrPw5o9dLhhVPoLOZLzRD+M7miptDHFDzZ7bbanfXcH97MEgALPZ+a8zLXBKtHXZKtw8Zdi2sh2BeM8lXaHRRZdMJPqG0lTtprXHR5n9APuGJ2zWbeDo07Ms7sA0/l/nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958792; c=relaxed/simple;
	bh=N9yPufDLoIJwHY1WRwsBi6vcmRB93huWJb5OKBZaQDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePlIgtp7q9szuuypLrXBKUdLsELFMEB6hqQvGVjB0HWBhvKqX643cWEQcGsIQx95xnZ5as/nHzrzzw4vDOTVdqF54iG1HQiSXn2JQkiGyirFz3P35V4yQVP7lxYov1d4nMFLmxABAEYcUVPEE43187HDHAozRjCQETUIszKYjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kk/t+jeD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kk/t+jeD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso437891b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 12:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958790; x=1779563590; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lh2VGoVOeoYSqwg877eUtdLNDz3Sgarf8cnJ8gkLPRY=;
        b=kk/t+jeDw16DRI/Wg5uq5lNJNg2jDJk93fyqwpffb09g+Hv21XYJ7pqvjl7KvPkqwk
         C4H0oIUTLlNZLQlbHLug3T5v5w3hJGcWdK6e66n0pfUL2cZBX68B+B26I3j7lihvKTA2
         0bcCnKpmo+jj/YHmNLGKVF4PNUebMLDSMHaRI8qe3cOu/ZwNzl6Go4pvZVllUPPwh+US
         5kZ9ppew0RfpuwOBaHe48TC/rMgHpjjkKcieqtrs/dJ3ufO14b366RCguj7kcEcIHrb+
         EEp7Guqd6TWlxkcWbiVt2CQqsC8FjeDE+yhVxQVNy0ozcmrBtt7Q5+Trf10zqNSsyEMh
         Kk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958790; x=1779563590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lh2VGoVOeoYSqwg877eUtdLNDz3Sgarf8cnJ8gkLPRY=;
        b=BOxerRLFMHyhiDBrnhU7vX0LVVAvhuX9LeLF+sSuoN1MfpltEd6Yqusgy7ciIG3OPY
         qDlMwKGB0UHv8ICew80UqApPPQJLCJMlWKnZCqr8fChpFjiK1YE/N54+gxGDnOBFIh4l
         7SR7jDvTEwDMJHhtmaHYHZRsPXZqbTzZMhT1NBLMPSfhR2DbqmVBkvPFsZxGvCY5b5zx
         ShzhhPKtER6VsG0myPrCimz89KULAVQlAMA6JrJCMziWpaNMFv4UQjVlQYKJr3LpIboL
         IqGUcElKIYdT1qgzGyaOiOzjSQj7eEo0xP6303iviQ9+lPFtswuPoQy1OE1Fi0MQTBHq
         cTnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8exQS4G0gjSHNtNRW/5HtXVhaVx2sHs9j/Ci2lUvvAOSIAS+UQ5GKyyJMGi08khHq6khjZ6j7mYROH720HfY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw26Hc3WIVk60iWRim+kJhZKiyL6PU6pjag9uL1DN+GFCek9ODl
	OhE2kW72WnIDPn+u6HnIa/CSZn5bFswzZ7+l0hObjMzjOpNzEiiGFgSn
X-Gm-Gg: Acq92OFYb86gYYV7a2ZXnDGEvRJ0az3WvXa/kxfHFBLj4DRYdmAV0hfPXGvH0F0tgkY
	5Dk0ClasX0YPYvXXhYhOVAk12U4zzxOUHkJXEDvaQVlB0TGIs5nBqD7Oe6efNrixKD7432VhhJC
	Uy9BNI8SqmjG6NF8xaBYG3tyGXzdGOS1mEXIRyfLPuTeX5PCWMEpUlEgjuK2i0HBtBFFumk9ag/
	UlkEfXqek76U876s60//Hl/Y76FTdxQPtNWu0BVUve+7r+0qxb/qMTn9Jcqhn/ZqQG8BpLXT0ld
	0wvwcjA51oLyvxfcn3bFamqu5t4fao00VXifaUeJqn3++ZAzMZw9HSvBN569BbPEGMyJM5Ie5G+
	+Oq8/ZKcX84/RIYAA8idLfyNcejX/DafrpfTKPanqoK5/Sc96dvMMsSj8w4c5Z3KAK6gPLDRrlb
	WGNmmza4HJBR0KxUcz9Bs5oBFRFfWAbS0+LDYnXpkhSpQu+Z+U1vJMhYDwxxnh/cyReykmTSUc
X-Received: by 2002:a05:6a00:ad87:b0:837:d746:8e1a with SMTP id d2e1a72fcca58-83f33ce695amr9482154b3a.22.1778958790321;
        Sat, 16 May 2026 12:13:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b296sm8904946b3a.32.2026.05.16.12.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:13:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dd37929b-ff90-4567-930a-26db01d85950@roeck-us.net>
Date: Sat, 16 May 2026 12:13:08 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
References: <efc4d394-b328-4ccf-8c05-b6470ee4b88d@kernel.org>
 <70C5331E-06F1-48D5-A6BA-0CD130B69A45@linux.dev>
 <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/26 12:00, Krzysztof Kozlowski wrote:
...

>> It’s opt-in on per-subsystem basis, as well as all other email-related features.
>> I do rely on corresponding maintainers to decide if they want it or not.
> 
> The trouble is that subsystem is mailing list, thus I still got all of
> them via b4, which is used to get the discussion.
> 
> Send them only to the maintainer, for example. Or maintainer + authors.
> 

For hwmon and watchdog I most definitely want the response sent to the
mailing list and to the patch author. That was the original configuration
for hwmon. Roman took it out because people who were copied on the
original patch complained that they did _not_ get Sashiko's reply.
That is a perfect lose-lose situation.

Guenter

