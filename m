Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165948;
	b=dOWRa/8BNfT/cvDzMi5JKdxwliU/WUrblNdi/m4FsQjYirryKMN+igc1CiImwVM/mNgr
	 HUypoYgg0vdGyLkr+Fv8SX1lJMdE2vnQWwvamwSCWMn/P2gSNLfzOgg5VLA+kU40uWSiE
	 41fQG1oEb37BdAkngg7b7rc6GGRHH7nCTOj3is3NeUJLs1L//FECApQCCeCyatVhuVMk6
	 UgqGYVBQLfcjP4trEtshRUj+dQiG1pvahzHIitoRz+qC76RfiWMl4FSCehrZQYVaqEjXo
	 MYmaeFBsV+L34Q0AYSSyM188GwgVi25Cdz4hKsv+US5bT0FP/MBWXB0b22CyfL3Mt7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:To:Cc:Subject:From:Mime-Version:Content-Transfer-Encoding:
	 X-Mailer:References:In-Reply-To;
	bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
	b=TYbcmfUES4o6R4ajzyZm8rISSKRINIUOeSLxnenCJvv5Vv28Y1fqtO/fMNQ2QeXzs2o7
	 GnN1Gv6y3hMfCRtUfhcW1MGWOwV0ALC0y8uRoJnjYiuJ4UkJLF3jbFGzbY7ZlM3iXrWlF
	 qiVnfde+19i1XLfWNCbS0iDNQiC3KYWueoFn6HTTQG2fyRk8cz2hcCh7sQ5Mi9ouu1UcV
	 ZcBeU/MvgCtBKM5OXcPV7N0twWl3swAQkNy+6Hn32llS1Y3P2aKrOCGBStjJY2f7DkKvm
	 Js0K/3P5GO4kD7qniLKkQanJinKAJQoRLDE3NOV9Ukn6PQusXm0g5fTntLZC4Hx/NHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJRrHVWy;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7E606A320
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 19:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E7E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJRrHVWy
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c49b431f022so38721466b.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165946; x=1794770746; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=mJRrHVWySzqaIDexWtb0NhvHso5f76VoMQNQzwcoMwKCNvgWFgba6nsRNbfnaGQWJp
         TgETvsvav/H+XFI6hI3xHSofCuyNFZTf9MDfG+6o135GM+8porda5D8o5nidr8DZMps/
         4o3BB5er0WBbZshj8k03NI1ko3zhI0VGa54kndQ6Nb/gB+q7Qn7S+NJnjjB+YWgYPJZE
         r7zW0wh6Y2WPbmRaIoxT0jQupp0k24mL3hNpC2cILn+aay7ELOqQMEQzR5QEN9Jz3S/8
         /506QjUIPQgzwafxQvV4S6UOzeBXUIMxLhlM9xJNQBW9Z6IZFX6C4BWf4XHiu5H8AAh4
         rq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165946; x=1794770746;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=iA9XXziSPpFP9FOHq6tCnryACgCtjnS73pnKzkogJxUS1Ers1YDz6WWTZQt3gMirSf
         q5U6dY1tpH6kp/ai3D9RaDgW5PGzyomSW5KxpHd7IhuF+Y11wHWY2M/zju2STu6Z4sm6
         QxBLuYdnQ6X0nndev/NPRybROZP9yW+QE3fGz0G5l8xZhG8EGC8L+GVzYkUkHbDSczCK
         oSPk3tR7+JB0YXVcrlhh0oefLEL0DdF2NLxdKRm7qjvCh73GmMXTozvUCBQVH1hEtuYT
         VTkNXQwRotewE5+K1qcSjlvNmGmlXymtCQxUbzydJpt3S2DAuVgi1/EseI5yY73zQdqk
         1Khg==
X-Gm-Message-State: APuU4Z9XXLX00ETZ7hV2o52iHChjVWm6yXE/PlNsx5GvTfvycp+NhHt9
	1/Dqq1V2CIAvQruFCvtS3z071Uaffj7/vvPwmw9SfT9dsvCNgQU53avKT9zr27mJaaJYuw==
X-Gm-Gg: AYBFou2vuARzLW+nRd61y1RYzzZ0yEp5w+vBzy9OLC9NYRJYUiTE5i+6u7FXZPOIugp
	lMB23DM9cZ4MKQnARLRvThjW1veEiY88yEZdBtf8/QlE6zsGmFWwjK/19Tz9akC96AvXDx4+1Bs
	KBl1A9g4kZ3vWH1WGDSEyX+L364N6YwLIylqWc5h/Da1QJ92/XCbt5vMUNWXN9PmiItV8FVNVSk
	A0CFkpTUWSXn/+bwDbOPWJtCxLXjq5bJffOiBGuHIBds4lZAIW9Usk7FV2GJUKQpkP7d+3Mvk0s
	mUG5h7S+BYSYvV29gwxqbTnQXHtGblZVjZ0aYpRxnqm/HmmeNdmXhNNSODvR+FgxENHCgNqogGT
	uuyQlV8lYMCGPfFMYQ7CVqIlj4fcVmqLkVIDYLq/MKk2fW5bexbEg3njhLC9E1S2/Ka76UvJQ5D
	SG0TmEaHdCMnU2RmmigXe7401Nb4IbKteqbaxZowW4TLsHkm4a3kCVpAMEkRF1/VP5+Oj0WIXLB
	smQsfZk/Fo006QHWI8D/yrknhsF/EWRqX8LUnN6CQgwGj2feddv5rVs0S//UCnSvSXqt2gcv9fh
	sbQSdQDtMxtjCalviYQJ1QWbaihNYrH0F5jwHAX7xVROz5ghLdrw3wKh
X-Received: by 2002:a17:906:794f:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c4d6d522af9mr142299866b.23.1794165946088;
        Sun, 08 Nov 2026 11:25:46 -0800 (PST)
Received: from localhost ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a5asm81036666b.72.2026.11.08.11.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:25:45 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 22:25:41 +0300
Message-Id: <DMQ2QUT58NN6.10MAQ6P7FML2K@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: "Linus Walleij" <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sean Wang" <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add support for MT6895 pinctrl
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
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
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
 <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
 <sashiko-outbox-203909@kernel.org>
In-Reply-To: <sashiko-outbox-203909@kernel.org>

On Sun Nov 8, 2026 at 9:39 PM MSK, sashiko-bot wrote:
> [Severity: Medium]
> Can mtk_pinconf_bias_get_combo() and mtk_pinconf_bias_set_combo() read
> past the end of mt6895_pull_type[]?

Right, mtk_pinconf_get() reaches pull_type[] for the virtual EINT pins
227-246 via debugfs pinconf-pins. I will pad mt6895_pull_type[] with
zero entries in v2.
