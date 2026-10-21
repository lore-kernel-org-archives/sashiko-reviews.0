Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613080;
	b=BKNydzQzjNezbo0uLKqNH2x9ZzE+yrEiYg17d9ePY8vca41cVpLzNl31Nx8VaJYzj7Qy
	 0k3F0g2o9HAtZO2VzOg3DV818fQQ6hEmEHha3koFfnvqzXherXYUyFdsDDimwYWUbVicv
	 StjVPF3AyJKRvzZj/weY5V2Ml6OH3PA0npEsAW7mTZuaVNUoNKSEFBzIT5e+ESjSkPWbE
	 YtZgq8tzwgQbbmRSApHXlqtoGcSyZYF1SL1cHYYB2JgyRfT8W0MbOzImK9PFuEKsRDK8Q
	 bk4/1Eo+5h8v6G0l6S7SUNcluMen2aSGOLv5VE4R8/ZEOVofw96kh0wd/cyJo6pyvuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To;
	bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
	b=khPG/L3mDqs1mVrB9i/8QJzmdVFqBHYBcbuGy+lgMkPDqIGLUj9hkDp3WApLy2ZBJjqz
	 +b36/MJ7XqDdDnrlMcXYtYjun5HejB29PHB+TtkjH0XFl7fO7m/Zo99iw7qqhJUY9jNj9
	 7Yv/sPbJL7rrrGPK+WHBzYkZivU3PagFISudCpTGjQs3vH7LfKlh2bKkEME9MnwhlU6Ju
	 6EqudFtygak+v0X2AYEL+kf73t8bnFvWOyfMqPgvjqUgcTvoio0AaiKJde5fcLzWqnpo4
	 CIXEXN9hzIkYrUvlMW2WsRKU9KS4RfSHhRRy9eJ6di2Nvj2JcYNTzjAWX1rbGzxNzxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JvPZGqsd;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AEB606A31D
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 20:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08AEB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JvPZGqsd
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1190890c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 13:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792613079; x=1793217879; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
        b=JvPZGqsd51qyXo/bs8Rh4J7jLZBGtKyOQ/CkPUvTV1D/Db5o+Lt3fEvHx6xPcfWBBF
         4zfF+zUb/SzwIZvVc62ey8liMLoduvgLitKDsGc4uXfCy/pMbkkD1c9OCfbhcPAPNSau
         i9udbNtO0GyuKLwH+F6eyaqOxvtJx1WnXepKYbjN7yxh9A97WIo0CU1Mk95g/IJaiW9u
         Mu84ju4sMYgL0ZB3iwXTVkHUN2VfODfc3rjR2lEgm8sqV0zUnqcAKvTd+2QyYIKgb7R1
         29i1QTgtLUHVmjCCGGHfaSaJUXvhaDrqoyobLuS2s3q6viQlyuXnYCuTTzdLIlDfl3T/
         DcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613079; x=1793217879;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
        b=bVU/XJwQYSivtZ/8NMDZasQiiCEGgLcPLAHWpbjwAIILJuVy6yvGmz231/JOAQnakl
         FPZx+1swB1sWJy6yQF56JwsBPv05sno2BbqAsvA9CpvXiTbJ+2dEpukPLcbrnZ23wzzl
         pt66DwXGeVtsEr6ZEb6oZk7z62mYfpz6Bd9x2x2iumnrW+DcRxl/gs+c2QFzeJHcGGME
         xObx+AXnvTW3oRmTHoZzRNAVH0HTYbN7PTXjB6xQvUfYCjxxW5ZbSs0HwGemqbv/MZbr
         EInpLGjJhQjwzTF4cZyMTqYfeVjK1mHVPwjErMuXZ6c18TJJuoaIgIj7bUOQVd3M081+
         vhfA==
X-Forwarded-Encrypted: i=1; AKwUvBzuhtrCTEv3ksmySP1II0q1devE7U0ce1ByVIXZQgeSdOng6c5c5G/vFYQXXCiaYrvrs33xnkdh6HescTxa0Aw=@lists.linux.dev
X-Gm-Message-State: AFq9FYL5VCZLk+k50bHydBsTfm5QX37JKuMp/T7K2G3dMU05GImzVso8
	XZMSmj4T8kThkEl1Dg/xVmamzenQfRRA8I+BEtQhrufA2w4+SSLSa+gintYn5T8Y2QU=
X-Gm-Gg: AYBFou1RvkbqKQ4ukMUEGoskbpwnP1xw5jnNqEk9phwbp3n26h6t3B35sO2X5XZpV8p
	9oxrH5+d/GupO6oQQ6WQznn33+FXOq2VbUBu6/xUSP3Fi6IzmqgeNCWtmjQmo6X4OEYrEmqH9pO
	sViVp6Yit1XOd8srP6R1A/I+L9a37AgxPTIr2RyaZGtSVOXi0QZyKKE1TFePZ9tRcrsmdXc1udi
	qjRCB3BVjm/AcI7U1JO1TPJi/OxmJmkXhJjCAHOjBE2Gk4LekYeWG860R4IjWNDwx3a9VaC0Rbo
	kBzkisblyCYlDIVxdovk1ewHw93ua49h+K0bhwv3P6iU8yKr7L30czjpFePCIqDKcjN8OUUhH9W
	15lp4ulirXsMBjW/U7IAiU+zPT/A3NWB0mxBPqlnrgT44r0XQ5857n7BwA0hdJrNnk9SJBxEmC1
	F5IBfyI3XnOFt46Um/w+QDt7Fs75X1Yx1bHDSb2aXPRPOWwvg6CHkbLnR59mx3QfjMDVaT28sYx
	Pag34ArjXQwYwQNg0g+yzP89MEEObu9heaTLz/NO4Bddsr2j7wkv3f3
X-Received: by 2002:a05:701b:290b:b0:14a:8df8:56b1 with SMTP id a92af1059eb24-1933bb42675mr16108c88.22.1792613078967;
        Wed, 21 Oct 2026 13:04:38 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm8694937c88.15.2026.10.21.13.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:04:38 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 13:04:37 -0700
Message-Id: <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>, "Guenter Roeck"
 <linux@roeck-us.net>, <sashiko-reviews@lists.linux.dev>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
In-Reply-To: <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>

On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_v=
oltage()
>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in =
regulator ops
>>> --
>>
>> Good that I did not just apply this patch. Do you have time to look into
>> those issues and fix them ?
>>
>
> Looking into it,
>
> Thanks,
> Abdurrahman

Addressed all sashiko comments in v4.

Thanks,
Abdurrahman
