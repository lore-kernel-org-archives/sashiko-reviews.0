Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429283;
	b=h86EDkplcAXkMXSRbch6jR/ySVkU/DxU24DJ0OaPZeAd74Wuc3wGK1gE8jfrBOjqyccv
	 y8mJM6ZeonTjq5Vj+pArwKMLQ1wCug2CTdjzzXN/kC41n4zZp1LMylSuLxZJ02LA7ZJyn
	 9kjwCRc4kmCWrsBQ15KzLlPcluLWq67APyNMUObn8id/wyEFeFwMuQAlWVHi1IY8vmjp+
	 NDtnRjOB0K4WziUdrx+r30rTbzv6b28b56jRjEGVelpDe3upn3Sgit1lCykgFHtYgDcJR
	 S+iARb8Be8PyKlk3pSsPQz9gr0w5nwFR/y5dKkwjSOWL4ONezKNOYXtgkkUBfCeZS4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429283;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=If2uBTwUtcsfMKQK/sfG9dFMf3mJdJUXPWloTYU+JZ8=;
	b=jVz3u2gzroyHINhJ5+Cv0tT+XDam/eIiInLPBxVDvqi70g89VI7irbSCtfxmKqnCYuRw
	 ZydFU7LyLtCN1yHu9+7m0P7Zi68umo5KnHbi9LCesNrRyCSQ0QCYo+PUT8749vCV2UXgP
	 5mGzxi3sHo1swSlviiXbFwmgMk8XDflODWZdK6hRVLIcApG77FBW8HANBn+GnQqEnW8Su
	 4BPz0KUO+EuFlkMMfMfQeFBHUYNWbo+ULI8C21kWrj+vvgrgfNbYckuki8232UMaUEKco
	 AOE7auzudjAslNRba5akeVflto/gJaoxgklXvM72web5FPWKpLVL5d4EV7fQ6hUK/bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=C2WNYsX2;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C4F606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 10:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C4F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=C2WNYsX2
Message-ID: <54fb42e5-42cc-40d2-9e6b-de88c170484a@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795429273;
	bh=5ugiLH8lIxJwk2DYuuNikhUFR3FPn+L3PzjLMFkEA3U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=C2WNYsX2VUK9ubAkdBA8l0eMLilWAxyZlFEc2Qvs2xDobxtWLrufuX3r313vblNTE
	 eXjlth2bTiE2z/VpKnFsjdzX9O+zQ1LxfA3k3i4FSURIvPLl2qiLg0qZL3ces7qJ2o
	 HtKSU5feeEJZ5SFK19lakycAhR7lcjrhR43sDd8E=
Date: Mon, 23 Nov 2026 11:20:42 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 02/11] dt-bindings: phy: amlogic: Add Meson HDMI TX PHY
 binding
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com,
 sashiko-reviews@lists.linux.dev
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
 <sashiko-outbox-227302@kernel.org>
 <2d8dd4ba-26ec-4b01-8361-09e6dfcfa5ed@linaro.org>
Content-Language: en-US
In-Reply-To: <2d8dd4ba-26ec-4b01-8361-09e6dfcfa5ed@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/23/26 09:06, neil.armstrong@linaro.org wrote:
> On 11/21/26 20:26, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [Low] dt-bindings: phy: amlogic: redundant word binding in commit
>>    subject
>> -- 
>>
>> commit fbd4563b5cd10db3f75db052197f808e3b36bc55
>> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>>
>> This commit adds a Device Tree binding schema for the HDMI TX PHY
>> found on
>> Amlogic Meson GXBB, GXL, and G12A SoCs.
>>
>>> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>>
>> [Severity: Low]
>> The dt-bindings: prefix already indicates that this patch adds a binding,
>> so repeating "binding" at the end of the subject is redundant ("dt-
>> bindings:
>> phy: amlogic: Add Meson HDMI TX PHY").
>>
> 
> Use the "dt-bindings: phy: amlogic: document the Amlogic Meson HDMI TX PHY"

Thanks, I will do that.

-- 
Best regards,
Ronald
