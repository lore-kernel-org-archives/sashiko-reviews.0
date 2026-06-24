Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3A1D416C
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 02:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782267562; cv=none; b=Z9hWJtvEY2lxs+a7L8rcXZ7dSi5dGpB5evxp/O82/3oAjXrQBLhkuHi59ZrMJoHjJKYju/KU7p/YDEu1caFSyPHbXW8bKsCJJY+0tZgU4bHKfadYqZey3sGmtOv5QNI5G65Y4paqLHQkplO4I3hGQiwLmVHcA5PkDwzvKZGacNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782267562; c=relaxed/simple;
	bh=fME1x1JbXvJo+/HlQZJM7uU0+Yt00yrEtLQVzUZjFEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OsuPJGAnrBY4ZALCvXC9rgVEzKp/cSz9W5OzkmAr3DuRQKsaM6ucFjsgUb9CbhISilZGlcb7iQg//d9jQtQD3lY70ferP/wLfRkoZKX7EaukZzsLwF9FfYAr56srelMvPmGzKrsvH4nIVAYqFjyS+WRfFsC1J+x0/J7Eks/fbgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZtAyU0b; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZtAyU0b"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3078e0dcd67so650661eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 19:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782267560; x=1782872360; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cnZxS1OtXx+JYeSOjw7QCe4thh3AmhlI2tSxzOmCpOw=;
        b=sZtAyU0bJeM9UDQJGdOoZA957y27moB4rTE7xqme2EvL1ebHtuB2UXtnhlgTTs1fPh
         fqdk7oosdHPQ36QNkWtWsryggYElOzd2nOButeIAPdk0HLGNShDoasMyKa10AerHn5cy
         P9p++h8pKC+hc1MDSHJySN38SgTrjddcOEDqTjp5K6m0jBHnr4jxKjm4rlL4BGKQI5PM
         12yuRGThcGqYk+MqBOMyBudkcQv5iXr0O+tvqpa6M/WUP0piY6HiWJy3/Ktzq61coOqg
         pyCtt+wbL5QQHEqvtLXqRcMmdADYFSzRhpK6pQdm6qm3DyA5sxYqFhG+YXqHmGmlIxGt
         rNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782267560; x=1782872360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnZxS1OtXx+JYeSOjw7QCe4thh3AmhlI2tSxzOmCpOw=;
        b=OCv7XxvCawGEVGftzeEoPPtlbGW/UEtJW5PCbTvh/FZYKPzQjnwSnseDbJfg6ucZxK
         PJEoFaT5YEudmkTwK4BpDmjGCG2Sam7y4HjFe6cV7HR20ic3/IfpZdQu0zn6+o21wAoj
         sc/KR4570dEoUH3tax9q3vySRuNE5hNbR2M3ZV22NN+27IDkjIvgR08BkQcfqSQZvjvq
         4OKk3AP7mKssV67c+Ori/nUTPiFIRR6LndSbwi4zUw1ThffauByur1g3Lnjb+pg6/FVu
         6DpfyaqcGT1zElbGFxlAKXJxvCSUIXitNZVjkYgvlTKzqD0MO4mWhWNHnWCd06tViPzL
         PGKA==
X-Forwarded-Encrypted: i=1; AHgh+RpCph8Xd20xynNbgeowEU85Y+waGjPEnlbjWRzJxfCc57A696umGhizQpFzgTVl5LqHDKiaH7jP7xMDodLixbI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTrSjt5l01VHDXqQol+0W3RlRpg3Tt5YmW6zu0SS+LSmkc69HH
	SmIww+J/Im8VO0dXvXlpVBVSAfjLtRT+ZCxV+fhQ8L6KxOT7PNxVPeyg1Gnvfg==
X-Gm-Gg: AfdE7clMdStG6G8kmVDS055g8pYS46RtlMCqeC/1oQyCEMWoi8VeH00UYr6EH8eiD+P
	V03QTAQ9FQX00762iPMU7Na6HdPyN483eCquKyKoK+PZxxGVCm/huyHmLWvCD2J5UdLtSLFIjQY
	TMdz77XsS//bXcU2xH7UUEWNIpMD4WYazbPUKdEZauAiLhKtXmwW29a651BT75r6s0e1k+rt2nD
	E958ck0KD3Wr71wRY606ZZyuL5cZgZAcZLtk1Qgmzvsz0OCGoyh5JeZsPWIEK4kSNCHFuFGc5bc
	mttWozM+GWn784X7HPXw4jlXajpzfB8dEpCvCsEwBpIZUY3PhGjMRSx/NXaCYskqqLFRBM3movF
	ZTyMfBs8eOmyj3h+RCgySx5l4gpk99AvB9g+SukH2RRFWowc90Tw+/EINyCHKCjc4eK1KcE21yc
	JKWRW71OhObKgLeLt3yjHi/DXNSspro5/Mqy61S8X+Eq9gEBDhnWbhqLk+zWASqg==
X-Received: by 2002:a05:7300:214b:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-30c68ec5a61mr2184448eec.34.1782267559912;
        Tue, 23 Jun 2026 19:19:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5c1056f8sm8120215eec.15.2026.06.23.19.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 19:19:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b3e11c2a-3b64-4a7a-b8f7-76773747d6a0@roeck-us.net>
Date: Tue, 23 Jun 2026 19:19:18 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: lenovo_se30g2_se60_wdt: Watchdog for Lenovo
 SE30G2 and SE60
To: Mark Pearson <mpearson-lenovo@squebb.ca>, sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20260622144531.2413447-1-mpearson-lenovo@squebb.ca>
 <20260622145631.DD7041F000E9@smtp.kernel.org>
 <9e76208e-6fb7-4d62-9a49-95fc03a06737@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9e76208e-6fb7-4d62-9a49-95fc03a06737@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/22/26 08:50, Mark Pearson wrote:
> On Mon, Jun 22, 2026, at 10:56 AM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 4 potential
>> issue(s) to consider:
>> - [High] The global `se_30g2_60_pdev` pointer is not cleared after
>> being freed on the `platform_device_add()` error path, leading to a
>> Use-After-Free and Double-Free during module exit.
> 
> I belive this is a valid issue - I'll fix in v2.
> 
>> - [High] SuperIO configuration mode is prematurely exited before
>> reading `bram_base`, causing the read to fail and the driver to map an
>> invalid I/O port address.
> 
> This one is I believe invalid and behaviour is correct. If someone wiser than me disagree's please let me know.
> 

How would anyone but you know ? Normally Super-IO access is disabled
after the exit sequence is sent (as "lpc_write(0x2, 0x2);" in lpc_chip_id()
seems to do). Maybe this EC is different and does not disable access to
its IO space after "lpc_write(0x2, 0x2);". Or maybe that write does not
disable Super-IO access at all. Again, who but you would know if the EC
behaves differently than all the other Super-IO chips and embedded
controllers out there ?

If you say this is correct, we'll have to believe you.

Thanks,
Guenter

