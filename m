Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67303CBE84
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 02:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699492; cv=none; b=qxy13UqecftTyz9DCfFp41V3PDVAu+jSesrgUM/IrzU6JC1dTh4tNomMgW80FAdEFkEb4JWusbvcZxFkP51/7liXzvDph1qsgjQu/sZ26umnknRdfXmtCOonqnNVREUmOdZpDvCXhAeVdjUZk1D9axASNVhP6df8iUCprtm/LvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699492; c=relaxed/simple;
	bh=c3NSjqj+y3FWD1owRPrzZW/MDUo1eFOI8gy/KlQbuOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzOLdi2jf3BTpAk7E3uXiDV+SF3jIjod1/P+YH2g0QgoB01nqDmFeixrsQlPaEU0sVzzJodwh+9PTxQ0JYw/VRzPy9EawLiyCXL8VokKLn1j125rqrsbNF+R+Kb5kF/QnXeX/KFvXYGOzuLHJzs8un+zDmGkZoQpIa6RfHDDwEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjPDwSw5; arc=none smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjPDwSw5"
Received: by mail-oi2-f9.google.com with SMTP id 46e09a7af769-7f4ddb9adf4so86794a34.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 19:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699486; x=1790304286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CiK8mJB4LGiX/oaSEFCC98/XPFlB10IwTwkG8LAJdY=;
        b=JjPDwSw5QnuHSgbwCtOXmZxr7OiihRhp30EE0wKzC9cPaaqUxrIu0LyQ6T8d2vv7S0
         30xT+xWodYbnLqL7iC6i0nfE4h5cLtxyo0SvwK6byrrFxEUHhX02uN2YFGt/HUJ7P1Gi
         0Nuo/5EXeKqCVOTp8oM21qw60DmCNnqlbMPtSq+g3zXipj1HkCI6OMqTbTGl3RyjTFmT
         P8ckuuVjOWy7J4XzBG9PxxIPmzrVeZVbScTLnI3QHU9EbAnzxTUEBQUQ/PFYR7JmtXyO
         KsBoVtm528MGG9TizbNbo1DwkUqcayzdITi5kKLPgZaqaorNhlo4xup2DiRJmtCImZjp
         vHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699486; x=1790304286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CiK8mJB4LGiX/oaSEFCC98/XPFlB10IwTwkG8LAJdY=;
        b=2v7LpM8xrhlR2KNB88wI4nD5ipV8dMlq2pFDfEBS239Wo5DuKsPIFfoYf8Leg7ogL2
         +zHt3G7QCx+AjnUJFFHc49nb6sgNLvucZJ+wi3afU3A6VEQVHR5hKfPiZpE9lKiax6/t
         le5+bTlljiVb+G+lKXnvZ1tnqtX9vAULbTffwzKcmM0+B8PZYcZfRH+wPCndh3+iI0i7
         lq6pQKaZfBGmmu/q8GGCEFYM5j9aHyV1zvisP8U4qXXFcuHRd+VQzZeVfAxSo5tAVJ5h
         Kcbk4HS81El79xf72LMghh6Syi5iMYTQayaC2Os2MdikhKsytCDIlOsT3BHp/3llRNvf
         DEiQ==
X-Gm-Message-State: AFuF++mrGqn8Qs0CouToNABL0hcjw+oibqtEe3cSzDlDeszbBTwyIr6G
	k5qIiN2bMKicblWALBkPLUDlfxO7X59vcnIxD2Uo9DoMVyg0Av6F5BUuMPFyofCc0Sg=
X-Gm-Gg: AYBFou0pU1HqyRf8rzhABQg/+3PreL/qmXf8J/JhdkGw1yjgJV7z+E0cfVC0px/muNs
	1LJyy0jppT6B8EV6JHvImn8FOpM/7yj+X1778kGUBHkqxNK1dbM16xd7C9z3DZLqDmOYN4tpAax
	EfXbJjqrudH0BjZ95pv7pdnR7oImvoz8aiGpRPsURlALFGs9GXUNh9P+7ao3JRo6Rjqz+O1iKQ1
	f9v8gh1lhiSypw+ybN+d84d5MKGT2xdzXRvmmJQ0MFcUa+F4GAO2o7q/Ygs+U4jH0HnIm7dRuZx
	p2EVUsSommE0JAGKzc3rIJU3wPrvowF8MDJzjIP3j0UdP1ySpmL++QC55SnZBXyTKls/pLYG5Dw
	g5YbHlWkZbDsl+clyIV/2BnatAmDW0lXNu+lW1NvT5qOE2cPPjBjIO2h6g4DS9YpptxfsCZTFyK
	ACTIDRRMf7P2l6h8FKWUWQpeEvdPWGUhUJ7OUyC5IOvxSeA6qt7NZj9KiLFwPy0zYHwWopabmIO
	RYcYfrz6Y1/GRA=
X-Received: by 2002:a05:6830:640b:b0:7fa:ac4f:79d with SMTP id 46e09a7af769-80de33e3180mr1387349a34.25.1789699486040;
        Thu, 17 Sep 2026 19:44:46 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5128838esm326230a34.9.2026.09.17.19.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 19:44:44 -0700 (PDT)
Message-ID: <3b4dc4b5-4e54-4a8a-b6d5-7177f341dbcc@gmail.com>
Date: Thu, 17 Sep 2026 21:44:43 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, lee@kernel.org
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
 <20260918022714.1B1591F00893@smtp.kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260918022714.1B1591F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 9:27 PM, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Does this mix scope-based guard() for locking with goto-based error handling
> in mt6397_auxadc_read_channel()?
>
> While this might not cause a direct functional bug in this exact instance
> since the lock is held across the entire function scope and released
> correctly, it explicitly violates the kernel cleanup subsystem rules in
> include/linux/cleanup.h.
>
> The cleanup guidelines mandate that goto and cleanup helpers should never be
> mixed in the same function to avoid introducing an anti-pattern that creates
> confusing ownership semantics.
>
> [ ... ]
>
Whoops, yeah, I introduced that while fixing the teardown when the setup 
fails part-way. I can fix it in a v3. Depending on the timing of Luca's 
patches, I will probably have to do a v3 anyways. I'll wait for more 
human reviews before spinning up a v3 though. Don't want to spam the 
mailing list :)

Best regards,
Ryan
