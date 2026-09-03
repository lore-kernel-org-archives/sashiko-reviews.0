Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA903939B1
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.34.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421806; cv=none; b=gDRzrxcAzvx7MsroDfz041KD9E3Nf9xnJAlgSaSdFWRMAAVTRiuEL8tSwJ8O7mgcZwavAD9R8+PE0XGNrnjkAAJuLt108HHEKiSppXU+Jq7x4hBsuubzfnGRtz2sHVThgkLYgutnmq33/dB5cIFYhkPhAY8S/iU7qJrhwtVQs00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421806; c=relaxed/simple;
	bh=DKGeDKlPch6rqcA5xhMMLWOX0/Xs3Yd59Yr4R9+myeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NW6BkEqyc3v+aKPKtnOJjZG5wAbv+yHSoAfpXitaCivvb1H+h0eD89ZDkqfLUh50hl7LPF1OqzONtOL9fYCLfUitA9yXtJOsC5p3EmtNOHo8STjOA0zEyu5kbX5df2Soub4MfrD2BvJSnyYZD8r8uDKxE7lc6uizzKgrafmJLEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn; spf=pass smtp.mailfrom=stu.hqu.edu.cn; arc=none smtp.client-ip=210.34.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from [198.18.0.1] (unknown [23.151.104.61])
	by cmweb (Coremail) with SMTP id C_Ai0gAXetmcJplqdxEHAA--.14790S2;
	Thu, 03 Sep 2026 15:49:54 +0800 (CST)
Message-ID: <ff197003-be1d-4934-bf33-9337bc833168@stu.hqu.edu.cn>
Date: Thu, 3 Sep 2026 15:49:45 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903073643.B92A71F000E9@smtp.kernel.org>
From: Raspberry Kan <raspberrykan@stu.hqu.edu.cn>
In-Reply-To: <20260903073643.B92A71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:C_Ai0gAXetmcJplqdxEHAA--.14790S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKFW3ZF4kZF1ruw45Kw4DArb_yoW8JF13pF
	97uas5KrWkC348Ww47XayxJFyYq397ZF4rZFn5Kr4kGr4DJF13tFZIkFW7KFWUXr18Jw4j
	9Fs7A345K34YkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgtr4UUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCFAAHss

First of all, I checked the device tree extracted from the stock 
firmware, and it explicitly describes a third pixel processor (|pp2|).

The original vendor DTS can be found here:
https://github.com/Raspberry-Monster/MiBox4-LibreELEC/blob/misc/mibox4_gxl_tf_2g.dts#L10

It specifies three pixel processors and includes interrupts for |IRQPP2| 
and |IRQPPMMU2|.

I also verified this on the actual Xiaomi Mi Box 4 hardware. Lima 
successfully detects three pixel processors:

|lima d00c0000.gpu: pp0 - mali450 version major 0 minor 0 lima 
d00c0000.gpu: pp1 - mali450 version major 0 minor 0 lima d00c0000.gpu: 
pp2 - mali450 version major 0 minor 0 |

The corresponding |pp2| and |ppmmu2| interrupts are also registered:

|GICv2 200 Level pp2 GICv2 201 Level ppmmu2 |

The driver then initializes successfully:

|[drm] Initialized lima 1.1.0 for d00c0000.gpu on minor 1 |

So this particular S905L-based Mi Box 4 appears to use a Mali-450 MP3 
configuration rather than MP2. I have not observed any initialization 
timeouts, reset errors, or SError failures with the third PP enabled.

As Neil mentioned above, the Mali GPU is already defined in 
|meson-gx-mali450.dtsi|, so this redundant definition will be removed in v2.

Thanks for the review.

