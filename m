Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928E1394EA6
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.34.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422863; cv=none; b=M0Ma1+Q39YJXdwVgwMKHPCAob+RLK49onyibcU25e0WR2Jk5r8uZJVbJJcEyhmT49PUMLwKc0F03/rvvSUtthtBq/i/Q/YfCxXDij8i3aAKjgKKx/8l0lbC9+MaEJoSn+KSKJTZvjfeTRdejoKEUeJln9yk+h7wbbL8y6Sbwijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422863; c=relaxed/simple;
	bh=FFv1El0cmfreCyaI5DuL1YXMiVHW7UPSUEXErngpJfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wv2hsLz6P3a2MK33UKBrkJiEfzXjcPlvOZet0sSG70dqAYPNGLw9BCQoOXVB9FV9Euepej4xvchkTobxbymlXgmFDJlmltenbWzTLY/EDkayZay9xA6BOp/UZE3l/t/YejnodGz6oaAD1DpzDgFB4aPOaKNL2c2ovvZILcT24ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn; spf=pass smtp.mailfrom=stu.hqu.edu.cn; arc=none smtp.client-ip=210.34.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from [198.18.0.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAnitnFKplqiRYHAA--.14660S2;
	Thu, 03 Sep 2026 16:07:34 +0800 (CST)
Message-ID: <516d8904-ea21-4039-a621-b98a8a5cea83@stu.hqu.edu.cn>
Date: Thu, 3 Sep 2026 16:07:31 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
 sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903073643.B92A71F000E9@smtp.kernel.org>
 <ff197003-be1d-4934-bf33-9337bc833168@stu.hqu.edu.cn>
 <3fc38e1c-d9cc-493c-a25a-61a8a173d987@linaro.org>
From: Raspberry Kan <raspberrykan@stu.hqu.edu.cn>
In-Reply-To: <3fc38e1c-d9cc-493c-a25a-61a8a173d987@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:C_Ai0gAnitnFKplqiRYHAA--.14660S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWrGw4ktrWxJF13Xr1xAFb_yoWDCwc_Xw
	sxuryDZ3yUJ3WrZ39aqrn5Cryqgw4aqryayw1DWw4fArW3G3sF9F45WryIkF1jyr4F9FZx
	Xa4FgFs7J34q9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2xYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxfHUDUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCLgACsT


On 2026/9/3 15:55, neil.armstrong@linaro.org wrote:
> Sashiko is right, is it _really_ a GXLX you're running ? The 
> S905L/GXLX does not have the PP2
>
> could you dump the soc info ?
>
> run:
> grep ^ /sys/bus/soc/devices/soc*/*
>
> on the device running mainline linux.
>
> Neil

Of course. Here is the output from the device running mainline Linux:

|LibreELEC:~ # uname -a Linux LibreELEC 7.3.0-rc1 #1 SMP PREEMPT Thu Sep 
3 05:37:37 UTC 2026 aarch64 GNU/Linux LibreELEC:~ # grep ^ 
/sys/bus/soc/devices/soc*/* /sys/bus/soc/devices/soc0/family:Amlogic 
Meson /sys/bus/soc/devices/soc0/machine:Xiaomi Mi Box 4 (MDZ-21-AA) 
/sys/bus/soc/devices/soc0/revision:21:c - c4:2 
/sys/bus/soc/devices/soc0/soc_id:GXL (S905L)|

I also found a teardown photo of the Mi Box 4 which clearly shows the 
SoC marking as S905L-H:

https://data.znds.com/attachment/forum/202106/07/172555ezz4nnyn4gln8yl8.jpg 
<https://data.znds.com/attachment/forum/202106/07/172555ezz4nnyn4gln8yl8.jpg>

Best regards,
YuChia

