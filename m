Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579773;
	b=rZUA8Yb+MJRI7YkPI6kT6a3rH/LLJILfK0ZgeNRjcyqV42E0n6BxQimN4vy0vKDAInbT
	 BsUG0pt2dIc77H2+8HfRu4szwuSh9K8njESQdD8nfcrh+dDtaAdiFEzgYI4FZJecchzhw
	 h4Jh/lNEMGaSE+4F6LZYHI4mCiKyKTgYk6W0k0FwOnGO9ei5ss7gXFCDwgE5IMxUNYitB
	 +GM1GgI3RAAk0TsyouX27aEWj7G1G12SClZwdbyqz0ciCRyr16/HaK3jqJi5jkK/rpJ9t
	 ihklfXjhZ2sLz7+O+CXK7iqWgt0DNUqVB8nOCkphQm7KTyOV/oDg8La40QPCHnWnbFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
	b=xv9aomIlIwDtoiHQN5sDAXZhcei3Ent0fboNuI7lmzkPr9oPkFesr4CnAoVDGoybsinI
	 WZoWZptCt7IfLnb2dL/l/Ku4VRXvkfkqy6BtNlFK+wOCmDbdGyU1L1SLLhVkLaCnN4y6Z
	 ZdRrPE0v1y4i38GreJbsqCQjaw8CKorymSq7GUvfYsofOCqa4CaAR14uUw4caE8BCbqDT
	 DYv9W2e+rW3B/G6Uj7jPJILcYB+YlkfoUKknHmnivSYyIKCTYP8gEEOKDikRw8pHMy2Py
	 FHywlz7nM18UWNWOMm0jiOzt9MIS9e2iLzJoiEx5d7vIMtLmeuMf+b0WQsG1eIDqjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYePsj9j;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6CA606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 04:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYePsj9j
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so3706103f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 20:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579771; x=1796184571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
        b=rYePsj9juASxSxiitQkd5qzt7YBj6ic3iwu6onQChrHTBx2KoScMS3gytDX/NQpwPk
         H9tFXvWpDJ9+GSHbT6yA0lXcF8JzYzQfny/QqDjFHw6FuKmJjNgo1rADhsLSyniTxZPS
         XjO25DfKLUGGQYZTEtb9RTJIggapD+MFmiAuFYysyLK22z9Ht3bLw02NPS6s3xuJRnnm
         hahkrSeLmJn6j0FQiw388DawevlSAaSD2+XnP4w631ydS0G/0HYkbYZH/P5di4VtVnz4
         5gIihct51FRz9X+8Ut4m4z0OiY/gTj4aVpHxOBdaLg7JF1Hjz0xgTK9oUK4lbDSut8Uc
         lISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579771; x=1796184571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
        b=E930jtmHKf/8lOcV6C5HpADX6bwR6M/ULAg4UF1VlbNMQOXJdbOJetzi+ipdw7BY2t
         J4/06i5NqoXF+86L529mvfx9Tjn44oxvhmSXgHiIukQWVjaxi8k/gt3k2eNcRg3VIWtS
         gL3xHyfWfG2xw0NNjVCnxxqBBUQUi9S9qyclbekaRhDgkuIc3P1aiPEwLtEijcOSBpQs
         I9zo8Hz3BGvphuS4ZhOOOc8c0SHQx5grdhoKrW3AWiRh3KihUVb2B2QyXH1SvBufgS3h
         TRowUUZyVNriLVvBy9b5HsrMSc5DjHWbvFZU6UByk79E8RIisTa7fDsHbObm/SFnTFuy
         stmw==
X-Gm-Message-State: APuU4Z9Kcc/D3KFzYbBhEVdbHiS2ozG78kxihkIsVKB0AkUhvpn4v9jL
	uW2i0XBOdQcMQzVt1nYOpqk/YYD7hTWl1pb1v1+b4N8vpz29qmXBVkffWdgRjwc6jpU=
X-Gm-Gg: AZFdTZecKzwTL0Jao7xiD7DmHN/p43JmPFoH1vF5fJ215rA5jbcU80Tia7KmCEttG7X
	Sq70Rcb9EcKj4Tgr5gGT1SiHSGlAqs9vPKHbRaA0fGF+ThkMNUd8yYb0s7ythbYF4RK51q8fGni
	5flYqSLzc9FpUVEQoxwFld+jxaJhwrKC1k/y9qSQhQqzKQet9wxkXdt45skIah7K0H1C/xlE+JT
	//XRA0JvratIwfn5723Ud2hi89/AXkTBm6dmvwvgywkaGsrKwwaCxqD/V5ehJ2SCu0sR/IUP5xK
	0+RgBSR5tTtkMlnBNlBpNVWB49VEFQEnfu8Kp3OmoyGzx653zJtcuWQtzNmRT9f3e5vJ6ANOsAL
	S6HccdZOb2u8iKhhk6T3H9jWgH84Mxfw5oaOmIh3cGKG7M65QEdS+anESs4J02u5/zQFYyCrQyb
	rTrBzqeTHVqLx+3kmfV+5drzaCxcT+DCovN9/oQvvE/zHSD0brbMYcQW3Oq+QMrsFQxKgipRiSQ
	hxRr/DUAeV9BZU6RitCMmBfXoQHo2c/DbAkZru/YtbdvYzLHRSmnHkhBbKttf1OabcUiRcZ/I9I
	ra4KcN2GiUzj6vQFkvCdlCVcV8w=
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr31743230f8f.51.1795579770667;
        Tue, 24 Nov 2026 20:09:30 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm29545143f8f.34.2026.11.24.20.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:09:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	olteanv@gmail.com
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: Add initial Halliday dtsi
Date: Wed, 25 Nov 2026 04:09:14 +0000
Message-ID: <20261125040914.2399053-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-232541@kernel.org>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com> <sashiko-outbox-232541@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 03:58:44AM +0000, sashiko-bot@kernel.org wrote:
> - [Low] arm64: dts: qcom: undocumented qcom,halliday-cpufreq-epss
>   compatible
> - [Low] arm64: dts: qcom: undocumented qcom,halliday-tcsr compatible in
>   tcsr node

Both bindings are already applied and in linux-next:
https://git.kernel.org/next/linux-next/c/7ceab1723610
https://git.kernel.org/next/linux-next/c/1cf95fbec47a

Stanislav
