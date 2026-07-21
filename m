Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF01EDA0F;
	Tue, 21 Jul 2026 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637467; cv=none; b=lKpgpWdxHc4F0TPT1nvtUZ+idVFnLqIkDkxulw490iI0pNwSnY6BcbIU6FJpZjffXtbfzhcfPvRO0BD9TnMoq44CL0sdxpT0hbv3vWiAzZjWDHxC3zbgpGgxiF9qHbil4ia+dN0keWQ7uNhBaJZplQ6d6x6avbwSTcONBZySwVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637467; c=relaxed/simple;
	bh=U4fj03Py4P0EnSAJIKgGip8KPplL7G7WTFxOCjzlgtU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=mQW+9SaOgNbRPIo1VI0+qAw/KqQu3ccJ8j27EBMKJy0dGWX/cty3H9kfnTddKaeOpJFqSIqH4NpiaJ4XCCvrBL5wTTGaZuQrIAqVc+4zOl0jPH4Ik236xAn7BEabpYQxuVPVM6GoFaYBrzf13Cbqv3OlqSQcgBR0Z9DuhF03mRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ddw+IOn4; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ddw+IOn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784637419;
	bh=Q3WVCZdvhuzyHyhwodqX72fDjFGew7fzT/sycGPfkAg=;
	h=Date:Message-Id:Subject:From:To:MIME-Version;
	b=ddw+IOn4Z1IxGNo827TTOcA+zo+Q+to9R0k3LDcjnGaUHh/cDeZIKYgyBCA42Ar4B
	 8sXAufBFF8gOxzFRuFbFHlKcYFtKDrObT/WJjwTMJDaNoeucGmSbTztMG/HF1tJJNd
	 fIRIAdt74fiza5NInm3MyPo7IijxG6dMTQPCXJTc=
X-QQ-mid: zesmtpgz3t1784637417te9d389f1
X-QQ-Originating-IP: njHsgAYR90QJ38EFUoM52TrKnqiRhrriBDg10lgkAhg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 20:36:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6462590554883498070
EX-QQ-RecipientCnt: 15
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 05:36:54 -0700
Message-Id: <DK495Y6IBTSP.B55YW3KSSPL2@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk,
 i2s_bclk_factor and i2s1_sysclk_src IDs
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <sashiko-reviews@lists.linux.dev>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
In-Reply-To: <20260717073330.3CC8B1F000E9@smtp.kernel.org>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
	<20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com>
	<20260717073330.3CC8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MpO6L0LObisWp8Fdvp153dHVOrxO43BDAzAf9lw1P+hBYQqaPgGyMW+g
	d9SVm2T1W61ScaEhgVHZ2aTvUoEh1A94cVJDBpQWNH1vaPN1xfv7cojiipphv4evFgV9KBk
	IzOrIlSaDxKoCfq0jkn5WdkL9t5ihEuuLdu23Gs/AgQepOPBz8TtMXKGpUXUMaEg/o0MXYj
	b+WkaIOXtcCvNQaBBkcOFoJpmZ6pXYXttzVq6aImQEHAXNVCKHU2GHyJVKxzDf09smXjQ+Y
	UnTEtghmk2Z18uJyukHXzM6MWFe0UuY9ZZkhXHFHIoss5PjBRTj093vTQzreH1lk5rh9dBJ
	2OmhnYgE4nlZbB6Kgm6h11TLdg8gYGV6w+hIYcTXKn/Q0Oj3X1kDHaOaH+QIcvYB6FkNvBB
	gsAQlN8AN4KP6+qnCLE5PtnUNGPFYUgwMUnEx8RT12j7/XAfS5/mU08fDKQnoD9I31UwxdE
	csYA2dwR9pdXvDT75soVS4jZfv4mW5Fz/Fs39kg7Ss6j+jNDFZuY2l3EwjFy3dw5lbLMfO8
	3/j62SWkeAeJlYcV9cMaJOuetEGDy6i5JgtXiXCLpD9pZ22uiFTpWwdft248fWWoQ+tiW3j
	dO/qtorJvLyDr7XuSOXoz7jM5siUiJUWPEJtSg0/pr8mCw/IdYrjrVhiNFekhV+18wVOR2v
	2+aQWUKhH+ZMeLsBkxhBHdMUGNcDtws41m8e6Za3y5u8lR9HLY4RLCVfCsn97nkXWq5tbKW
	KtgtJTuQgD+IvGmb3i/9bfqnuHYzm4QKZxBz/YRKGEtlXRcWKlBCX1d7E1IEWmz4N6V1kKb
	veiqGotT4qh2vVcwWxC40N4EF1NRfwRMU+xPOHPMQt5D9IIAQWypfOD8EKfnF6f5mPclKra
	33v27ajhFXCUNpUFu/fDGxtarPQfoI1YdaEo8nsulpoH03pufc/MHx/Y2qISlihqroXq19N
	iQlct0ZBNFN0i3qS3JG8SfeAuY/IhnWm7gEuZ2I+hE1PTeFgMFAtniKhusZiePF5uY0wGZs
	frjQ4R1M3v1Z/u0/gFc26e9ZOnN/JPWTGneCcT9N21kfjCq5JQe/HzsVXZ6TY=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

> CLK_MPMU_I2S1_SYSCLK keeps its existing ID (47) but will be repointed to
> the real per-instance i2s1 clock in a subsequent patch. No in-tree user
> references this ID so the semantic change is contained.
>
> [Severity: Medium]
> Does the commit message reference the correct clock ID here?
>
> Looking at include/dt-bindings/clock/spacemit,k3-clocks.h, 47 is actually
> assigned to a different clock:
>
> #define CLK_MPMU_I2S1_SYSCLK     34
> ...
> #define CLK_MPMU_I2S2_SYSCLK     47
>
> Could the commit message be updated to reflect the accurate existing ID for
> CLK_MPMU_I2S1_SYSCLK?

Good catch. CLK_MPMU_I2S1_SYSCLK has ID 34, while ID 47 belongs to
CLK_MPMU_I2S2_SYSCLK. I will correct the commit message in the next
version.

                                            - Troy
