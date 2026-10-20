Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522721;
	b=pTieOfQ1GnR2zQtyLjfnH/56tyBqVP5Ux3CgxjUxk0W3AOwY3HuEsCSyPFwxFBRMki3Z
	 9SlCXM/3rKkT0V/6nQ2t9DkzBM6pfKTDsfj/mf3DlFSQ53FIn6NoodPL/8xjUuS/C6vEd
	 Slx3H5g79DSua4FE259KL3Seqjy7b+26avVQ1oN49unrTc+mC2k0L3imx1dL5CgoK1HZI
	 a6oX+QhvyMuNrDhTs/DyIjivfBTkwmqYMh4rqgtHIGyvS4ERAUZoOaRM32G3PtuX3Ibp4
	 5E0MrNOlYxDNMXAw8yP79mlWtpWV5MxACQGVy/Kl91nSxi1mJUNmUjie7E5qmAFdP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
	b=qYbt0M6WmBNwlw3QKeyErZ/Wgrw2qAQwd+pmLrKiHQasHtWCtrO1WAZVrNOmevjSEnaH
	 0c8X5xtHAhlf80qtsABXFEuf1YKIN5ThXyMQ2UAzRidFJzKXEvwEeiVe5eRS3xOg1XjTV
	 +sVE2vgweGdz6FuN1Iyf9vXp+VglTLPQH4uI/zer9uKclnPMTss84INTwNhd6KHrpNwAN
	 5i9ditCdYi7qekS+PRro3zU1Xvc85+d0dTcslDu73NrPOmNekFgrSye4Rh8tHKnjAUAhq
	 XSVg6ZVQ68zqqokvUK9sWoazMCFl4wtgGhF7N0u+bGqAmPkCCTtUJ5tuwTZbeFx6sMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=SDUCNSE8;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50C606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 18:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C50C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=SDUCNSE8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso6571907eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 11:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792522721; x=1793127521; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
        b=SDUCNSE8IX/R+37qINXW7Ykn3BhtNdYga+vQxIUaCws4Mzqc2Lm2QCtEoBAgkUnx5p
         0sbs1rvxfqLY7fXDW0YVARrQsOWbZHStkCI3gYEw0BptyXg9Gu2QRCHjqQQEjYng6Igk
         I2QflQNFHaw9b+inI2VrC62QfKjBpzXwg2pEf7uSPTGB/ijhc+qf2weRUY0jUIP6xrig
         HBUOSoXJsLYeCPlBhzA5q9NEhCEM/mipADy55cTRCJ7jdrBLFo31yAM0iKa+HGJPutv8
         DHgnQJwYJ0QjhfH/jWpdWItn1udJxtVHvWL6K0TEsNkhgPbIh3AlZQUyvWxFii83wRz6
         HO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522721; x=1793127521;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
        b=mYorsHxUUZn7MkkM+m7+wpj1Y+CykkxvK0eizFuRvH3XOzCyws/r85TFVNGXY/icDl
         mrHoNVLI7S/J9JL2zoXKAM9Ki2Zbno1OFHE8s7hICd9fBdcGeedcOfeKduCmibb+xWiN
         IT66hRZDcjxS3V+OAqy5zKD5qxvuhSGOUpNSZ75fOONouAzjZVSyU2KBnOITBqgL3IQH
         LOAbnM/icJvBZReif0N9edXh6RpyvKTUBoQy+3hftyHaBxxVjXAtpaYUzbzwBlai1h4e
         /1fskX94TlFfTQR1AkmqtQrd1BsvqU+CxBvHYu4L5dnYzP3n51Z6sU5of8ox365NUs0Z
         a7Ng==
X-Forwarded-Encrypted: i=1; AKwUvByW//KPbF9CsKnnjpkXRoXzXf2UtCyHsWYjuphzEERckZHyNzgzgJClWOyVPYxIuUb1qy0IrAoSDABooTbDt0s=@lists.linux.dev
X-Gm-Message-State: AFq9FYLInuXk1zVMaZv0nReXfsbXnjBts7xWrys2+EEEbm2/YR+AQOG4
	4PjFN7BCV7MnQDvL4Kf/H3BLQo2KI4GnrhZWEF1RUNWNR3MonhiJNx4WcRpd1HBEE84=
X-Gm-Gg: AYBFou3Q3fDjEWam/1YwMVnRKaibKrtMBYXD6pnqLDrg+g6ecHgmItdP0HKoQy376gT
	j86pbGCmUoHWxJpUaasLFPSDXaeqKA7Ylu7B9g9J/mJtJnJVehdpw3Uljbw+WCykq8L2b+qUDpW
	H6w2RL+LS9Exk3W2P3LSAw/9l/m3eeA/jv1X5Oy39qJ3/RqSaIexvSkBeV5Ce4MyfUsXqoGzAZ1
	7BW/TgXpJyOTDjGoXaKOtvZOrvXq6kbaTFSG+DQqgJm4uigBA/PB1Fp/u8MtiemHS6pbO+mHBLR
	Yw/HhQ3menL8Lxxv6bPsmyFEuXAmwJrzFuDsae11LrBUEbcqsRpv0OLzx9jhntyoAIMkFGnTYr/
	9mj2wK03hxU5ucNC+GbSNv5xQqkWi1GN3wzgSKYTXKTDHlxFs39lzvrIW+1azuEY8Iplf01hfc3
	2vJDMf3fZFmjs2U7Y0nAXCw0ZVeL/xhKGBg8gAs7DPPjz87ET/8OWhfihj4V5s1J+vAJhbO94=
X-Received: by 2002:a05:7300:4627:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-3674e164a78mr171066eec.25.1792522720294;
        Tue, 20 Oct 2026 11:58:40 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm454400eec.21.2026.10.20.11.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 11:58:39 -0700 (PDT)
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
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 11:58:39 -0700
Message-Id: <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, <sashiko-reviews@lists.linux.dev>,
 "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
In-Reply-To: <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>

On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_vo=
ltage()
>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in r=
egulator ops
>> --
>
> Good that I did not just apply this patch. Do you have time to look into
> those issues and fix them ?
>

Looking into it,

Thanks,
Abdurrahman
