Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E05360EE2
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478474; cv=none; b=V5fPsd06x/MoFZOxD1DukF9EEV0m5+OURorNdbHYgEL02WT4CJRYASepqcZHug4cIGb/Tu2FNE4JLNWTlznWDu4Wd9HiaigrzDGqLzxo5Nsso3MPf2nl8Te24vlwwWn6TTXlQl5zD6yxCcyhMNRM5LhfVs1dsSIaTHGEGph24GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478474; c=relaxed/simple;
	bh=sksmWQrpcwrgOdWpAjFOtLfESA7gjmbL2+oXyHXtHM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CilTygm5kEhuBddWTAIjtIkv4UNQfrp+ONh5iTX5A37noqGuD3O+GPX0SSUMjM+V6eMKwRqpqdWt/ne1FzMnsfdFMTo834cSsrZKGOqUiyeDEAoT4KA/+W5zDWMn7XrCZ6RvrWiH/E9nhPrifv8d+RTyT2xFcI3fhIF//+VNlRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUCmCQjE; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUCmCQjE"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3044857f09aso2332600eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 12:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779478472; x=1780083272; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7tuHeWFtSMqYg328BZf6n26qFVk0vX/eoLKUIGqEIUM=;
        b=YUCmCQjEHNPAJ90EJK7n6bmqOwExuOY2sA01fcrtzeHpje1O+0L6heMvtjpm84LPQd
         AkTHP/Gzajo6PZb9iQhlojuxtbbojEPv5lWZ2tFtSdydhMuR7phtxlcPxWvw4gJh+jTM
         /XujmDimpNUh06iOOgYUaAGoq/RMfSyKB72juBXsbERSmAXBU3Job3WFyJ3aUCQpJA/N
         h62nsEMBsBfaMEp1mugic0GY7rtBkky+YYZAOFyUDd3viuf0N/FbZ+Us9FGW7Or0U8v/
         oHnu1Zx4VTaYiG2smyfVyxwLfvt7VaqeVgXJYYpG1coZsRBQVUyw9u4BjlDaZj3cIgTR
         0mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779478472; x=1780083272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tuHeWFtSMqYg328BZf6n26qFVk0vX/eoLKUIGqEIUM=;
        b=kIQTn3peSYa4klmQSCjWbmIu1T6FivmkYqNBxqicljlTjer5RcA8XbD4Xu+y/qEtvR
         iesG6+YLgZ8fWItqnYzkPlkqEeBFWzeRwiofG9tnkpd5lCpdk3ExH4cisjFRxLIIP0BF
         K7wfPvIs4m9CAAC7or7U1ndMDdGFCYNTLp/ZT4Scm66k3T5tlxtvIbprAYjysnoqJNeR
         UgxF0Hvq1psypktc0CqW3kQwLP1tiDV+Qp/g78y+dZx5j13zlaYBl7hDwbdZUQMlhkLz
         YmIae/Kc+UVKIhyxhOUOj32MMoF0p/i9hCExHhutmq+XQxAfW2fMwOUKOfdw+l5q0Szp
         ddjA==
X-Forwarded-Encrypted: i=1; AFNElJ9HVnJbeT/LXUUonj98/wgf146JSF7UMuXRtglaiNI3z1dihIuVUlAGhF1QgPQenZvlC8ukS8W37ElEVxyaNQY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCPHaZDEZ6Q5EiplNs8bJmT36xvdhEymSX41gL4o4jzBQNytPI
	CFkrQ0YbjlSF3nQia4oEKrCbpJ7hQYW2HdOEASVAKVqzEGR8DNJz+GFy
X-Gm-Gg: Acq92OFCkxd6mzcYZAqUDX3vPon8auA9K8dllKOd5KikpwpSg76CT0mGqxqN3u6HwqS
	LoqeGlP3FM3yGqi4PsSwSgdZFLeOFuxDvAWp3twujMHPFxCxPQ8lXss3wSmEDGqGPwyNuosGNyi
	uMQEeERglyA5Pxty/QmwUygafaUuK9WnzfKQMwXbT9/wUCsNDFSqARMeYt4JSTLsPL+H9qnlEaG
	CZW0HQIKtXps8JMWnoYaje4viRh9618ER92ol7rZAvclu2dfyJf6Uc7oR2N6TcsX/3kNQ65Fvrr
	q1Ql0+8HJynhJki8WDqw8a8Ouzb4eJsIehrSXE+f4+jRho2X9KIfDjsBc+UiDDn/UseUZE1uQkP
	BVI/7dlvSklW3wCI/0zJ6SSeQK38Ds7G97E6ge838HOxE0eBXqIjQwnpIFjwbw9H5XyGBfWSu2q
	XwQRPXSD/9Rx254hTdUihKVKYQ3+b0KzIIDTmfvZrY2flGu0vYQZnOezjUYR5aFIOD9Rxf/9dc
X-Received: by 2002:a05:7300:bb04:b0:2f2:c336:7736 with SMTP id 5a478bee46e88-304490d8aebmr2636799eec.29.1779478472088;
        Fri, 22 May 2026 12:34:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304535ae870sm1596207eec.19.2026.05.22.12.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 12:34:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <07e1194f-4935-4713-a4c1-6b587e9aaf75@roeck-us.net>
Date: Fri, 22 May 2026 12:34:30 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm63) expose PWM frequency and LUT hysteresis as
 writable
To: Jan-Henrik Bruhn <kernel@jhbruhn.de>, sashiko-bot@kernel.org
Cc: linux-hwmon@vger.kernel.org, sashiko-reviews@lists.linux.dev
References: <20260522142850.E67A01F000E9@smtp.kernel.org>
 <20260522184748.3104415-1-kernel@jhbruhn.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260522184748.3104415-1-kernel@jhbruhn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 11:47, Jan-Henrik Bruhn wrote:
>> Does this code handle I2C read failures correctly?
> 
> It does not, but none of the code in this driver does.
>   
>> Can this read also fail and silently truncate a negative error code to an
>> 8-bit unsigned variable?
> 
> Same here - judging on the existing code, hardware failure cases are out of
> scope for this driver if it has already successfully initialized.
> 

Interesting declaration. This isn't about accepting your patch as-is or not,
but please explain why you think that fixing bugs would be out of scope for
this (or any other) driver.

Guenter

