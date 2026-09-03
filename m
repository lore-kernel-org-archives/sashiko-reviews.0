Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB03399031
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 20:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467954; cv=none; b=mOFwYfrEgkjaS+/gP/Z00FxjNEjAnuNncBVLqDzp9wPIoKbi+yFA5VzWcIgcLAmBea86u6qJSnhcD3TA0jxjZo7mGLbWiMZVYGBZL51iUbJzG6uUyWEwZh7R4Jo8yzcRG95dVfTDx2cPwGPAeepdEG+E4ms9vtHtgfgsiuZnP7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467954; c=relaxed/simple;
	bh=eZnBBaxGkNcJX5ratb7mwDxrhK2EaWxSIwLNS7LdY8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYKsIKqPkBpR3CkwVTYR1fdE78EnyU3qkYpgoLjvavlaNQY0hndJe0rxAF8kfQAeA44i+Kclm5gOf1StVMxvERpXSOzSW8eoehALbAGtZW/YaGjpHXhIrrORncxUwymzv5YwLMC+n48neTnEc+K/DfWgWgqBUgtcwt223zkyipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbebKw53; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbebKw53"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d710632717so2838885ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 13:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467940; x=1789072740; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eZnBBaxGkNcJX5ratb7mwDxrhK2EaWxSIwLNS7LdY8M=;
        b=lbebKw53zbz7jOUrVkANYP8lYJBKs0EmjdLmpwDjTw7C0RWF488CHUfRf+97BZ+Q5m
         ipOjGzH0PFgN5T06nRhWfQAPis6Qw/bm1SMkN1ofX2A/jeytuXz50jHixKeLxfJ7Aa1n
         8/I0xAzWafIUaOIez1fmc1Tmt/jXHDWLHCpmiAtaQ4TD0JtCUsoJwL8VHpIV0nlgNELp
         ltF6dZ/q/PklDR1gSqXjNJnKzSdnP5ZAjI3/8KEAV46DXUuK2/jSORBCOSyEcN6e42gH
         srQy8kX0Q6mo3x0Tg+s+ZrHSoaGZPiFM3UQcYYnGtKeWqxKsvUvg3u/7ZmWuECr82AVM
         B6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467940; x=1789072740;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZnBBaxGkNcJX5ratb7mwDxrhK2EaWxSIwLNS7LdY8M=;
        b=XIuGESxEsDk2RHky8fIqbCmThVFon5/Y+grOy5OxZl7ZPvwGeVelXrZ5anEngvXFs9
         6McPZtmEsjXm0zrnY8ku93VcVRa8sqfPVlxJnANL7hu6N6S7xnlCoYWqJ0UdUvGrztF1
         aDEa5GcFJnZGX8seE8UoTwokThliZ8Qu7IRr39O5yEU7NvskgrJykGzajY19VYqbXgcC
         ypV4iZq/o2qZJZvOSDUWKMgEqRzUwi5pbzNDiCIQgzM5eyVg6Qw7FieJ/OTZ26FZIRaE
         sLcGv6Jf8ivFrt5VxVWonMCFp2Na/vuFSxbpJTja4V8eF2N+KQgsDEYvCmHKuoW0gX4r
         TGTg==
X-Gm-Message-State: AFuF++kHvi2AwpXA4l3Z/s/wA7h+upAoDayVQGMOrHbt84EJOpWBBgrK
	awVvUsooVrFB3GH/diFldPQ/If7QmCTFUbhNJB3nkc9Rqfxt67T1w7h+Az6lOW/hXOA=
X-Gm-Gg: AYBFou3JEN8zT1UEZozKrd9ET9O95rSrq1vnqa9+qCGSRNoPbx1pDsq5aw7Za0QJwSo
	QHF2eozLx7pesKdSvOcmGJ+alZFmVp0ywIzEqW/GP0LJm0ZpGOakj+Xj+5aRQvL0D7zaZxkZt1I
	5blxdKbUxwdSshLEF0nk69YxVWqDMCA2T4dpiuNIJp0y+QqbkpLAnVmvXOD6LsaQOMZ9oyRUj3E
	/3YtUa7KhRJFx+ksICvgTbI18pK38zJnFmPAkyk7zOFXwdtOawODyL3AvGD59gsdl4BasOtX2I/
	YExLTjjEt7Uiy4gvbcuvau9sl7bWGxKHJW1hEX37ZxLwkZxIHDaSEsttr+57BRY4Mhjs19Wxlmr
	7sAlOzFu2LMfTjH7vADn/KXHG4JRmKxzccNrtzgNEGinrYSD5huL8H4cGthK58yj71QlfLExGyi
	yCCD1eDKVo6HeKfjXhZ3VXsZtITg8jgTNWQt8UW/kFW2MS6q1tQn+w+KaIIfVd0+s9yE/aDTDIH
	UVxFIHgPQsOM48HeiNyZXuVvNtvr+ULWgfailydtpox1wT4
X-Received: by 2002:a17:902:da8a:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2db127ce3bcmr21894505ad.11.1788467939845;
        Thu, 03 Sep 2026 13:38:59 -0700 (PDT)
Received: from ?IPV6:240a:42cc:7003:3e3a:fc79:f45d:5f5a:f824? ([240a:42cc:7003:3e3a:fc79:f45d:5f5a:f824])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c1363sm892335ad.60.2026.09.03.13.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:38:59 -0700 (PDT)
Message-ID: <6c145ac2-2163-42da-a204-4fe775113e07@gmail.com>
Date: Fri, 4 Sep 2026 04:38:58 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Input: tca8418_keypad - fix race condition in
 interrupt handler
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
References: <20260903192942.21906-1-liangzhan5dev@gmail.com>
 <20260903192942.21906-2-liangzhan5dev@gmail.com>
 <20260903194114.D04281F000E9@smtp.kernel.org>
From: Zhian Liang <liangzhan5dev@gmail.com>
In-Reply-To: <20260903194114.D04281F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

You are right. Reading REG_INT_STAT does not clear any bits and IRQF_ONESHOT already provides protection. This patch is not necessary. I shall learn more next time.
