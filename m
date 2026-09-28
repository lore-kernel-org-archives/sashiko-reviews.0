Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C9A331A5B
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560227; cv=none; b=V3ZfvAr3R8y+tPR3FQWNlksdy5oO3DPxYINFx5in1Ol085GZQt9DYzrQaiAugwdUgEK0WMAUS+l5IXjIkI/U3lxB8jUlqxHmIJoEyMH3f7i/BF8B/ui1Tn0JbP4xX7xL2lyfEGb7E/A+g8DxOguTv1Kg4tWdsO4mKA0/LBzBMZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560227; c=relaxed/simple;
	bh=oZZwyOyrJxErmQQ62VuMBhn5L3HeIbVfJIzCO+15uY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0NlRXRPlKzlcBR6KvNiuL9g8bkQvUxI36u5+ka/CIPLbEydRWcS75AWQiNR9gUDu+JoT/153c8v2fi3LxMk0edQXeLrD1PDk2t4lAtOdK8KnZ3dqfaFW2TnGOr/xlvtbKjs85pwlSmqPArgJ15X5YcNqOvG/UyA3wajx9ey6No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=bvu49JN2; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="bvu49JN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790560209;
	bh=vs9OjGFUvLR2IcXfvHPjZEICzzQ8tCo3ejxMCSfdXoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=bvu49JN2VyNc2wgYYfhsOrtbV2s0FF2TU5SbF/Z8k3u0X7G3iAJJAwuT3wFB2wY4P
	 v2rjnUhUsAw41NAkUqu1v+dJN7X7B5zt9xZUdGjxIRcpx3JvIp+7ys4+9x7BZv1P9b
	 NQMt7GvrDmO7u5XmReldizw/fkyu1KNTi5zDxzr8=
X-QQ-mid: esmtpsz20t1790560204tddc7f036
X-QQ-Originating-IP: 4dDotzUvSNuH6Gr4842sD3Njqis3g6lY9SfMnLQVM5Y=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Sep 2026 09:50:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8208871862891749513
Message-ID: <3D524FD981B0F437+563fb2cf-7ac7-4f13-825c-e2d375c5f3e1@linux.spacemit.com>
Date: Mon, 28 Sep 2026 09:50:02 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
 <20260927-b4-spacemit-k1-usb2-v3-6-ce7095896039@linux.spacemit.com>
 <20260927114933.ABD2B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20260927114933.ABD2B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Mdc3TkmnJyI/83LEBo2Rq5WIYUn1Wd06xO4LAf3F+iTcJGzbe9Bogh36
	qO2NSI/ENqZu3dFSQdWpTik2+kcV7WdtgQAXA4v6PLEWpT8glHP2OcavVA5PpLh1ySsQyaS
	4dwCeNw3Amwxf7ZASYm2oI90EDy9o2TBi0Ht4x0yzvAwMcR2QfzYozsD9RMUisUgtT7Djl+
	oem7Cbzj9hgl6EKZyjrfQPwGOznmzR/8USHdHUGTuGiaxiH8UZi+e9E5Wdrz8TLqvSqkfrM
	oH7OAlBtS00i+5VS5gGDKcrMwB44LM5KOm+bQqo/YcCIUf5uJBpYLWnLmbMTc3BfeO9YSiC
	Yi5Of0187Yks+yVoNjNgjwp15ialXtvY78lnBPBCA5Xw+Qq2SouTSQbVlshOcTovoeKOrYg
	Cjb6Qqn2jmNLn4HjpKt15ZeQyukWQl9fRqI3YjFqGSc6Wha5djLcBikBAehzS3fWHjZanVT
	duBxkUkAyYerhUK8sMYxZFW6U4Avra6l3XITCloOPkWo+eeHEKIBDgeIkZt8fkxbDG+g1c6
	8buT4fiwy1/CifI4eVzPVF761Hs2MozCBfmXelWpFFBiUwugHXWkeyEQPhIR2S+s7NQAvo7
	eGLp1IenSEPAYjKLWfjUjkiumwNNaJefgltUvzUXkmWkYDrJZnnhrKq6biM6LSZQN9B1oKk
	gBjMArIzdKtkQvAUEnn2IxmV1KgbBFd1w1C9N4ZQZ4atm6HvynIigA3VllQ7SoX1hMNR2RQ
	OgX5GGfZ6tJ9hTYuPrewjsBr8Whse12L3/dXqtmdHReLyWzc5ScCE123ZYvpyko5xTyoYYx
	m9QnhQ2Y+I0209pkcnAmlxoK/u5yqXeTTiGqXzH0s6cIRF8A7Tfcc4r0dj1mlUryiv/t26E
	WmRa09+H0QcE7WUqeJALmeZTMGPu4ussFprAaNBxpBUGiyygA6rdEUw+A2xt7YbqTr+D/6W
	njVzG1JeqnjDiq9aiVl8cELmEKm8PoCMveKpnHLKZ1xzGRf50p8xbuy6LzKM80ojno//VhV
	k4XTges3pz63r+39os6JePZMVTzPnrhc3zTC4y5iFHDIHemP/78oOpPTijIkY=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On 9/27/2026 7:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] usb: missing usb-role-switch property for standard sysfs ABI
> - [Low] dts: board file nodes not sorted alphabetically
> --
> 
> commit 44aeea968dbe19365572cdf8df737d1b44de83c9
> Author: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
> 
> This commit enables the usb2_0 and usb2_1 nodes on the BananaPi F3 board.
> It intends to allow role switching via sysfs for the Type-C port and 
> support cellular modules on the Mini PCIe slot.
> 
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 58035d886bf67..ce36250e2debd 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> 
> [ ... ]
> 
>> @@ -383,10 +383,26 @@ &uart0 {
>>  	status = "okay";
>>  };
>>  
>> +&usbphy0 {
>> +	status = "okay";
>> +};
>> +
>> +&usbphy1 {
>> +	status = "okay";
>> +};
>> +
>>  &usbphy2 {
>>  	status = "okay";
>>  };
>>  
>> +&usb2_0 {
> 
> [Severity: Low]
> Are the device tree board file nodes sorted alphabetically here?
> 
> Device tree board files mandate that node references be sorted alphabetically
> by label to prevent merge conflicts. Based on ASCII sorting, 2 (0x32) comes
> before p (0x70), so &usb2_0 and &usb2_1 should precede the &usbphy* nodes.
> 

I think it's fine the keep current order, same as dtsi.

> [Severity: Low]
> Does this node omit the usb-role-switch property required to expose the
> standard sysfs ABI?
> 
> The commit message notes that the user can switch the role in sysfs.
> However, by omitting the usb-role-switch property, the driver defaults
> to exposing its legacy, non-standard driver-specific sysfs attribute
> (/sys/devices/platform/.../role) rather than registering with the
> standard USB role switch framework (/sys/class/usb_role/).
> 
> Would it be better to include the usb-role-switch property so that
> modern userspace tools can use the expected standard UAPI?
> 

Not now, the current standard role switch framework support in
chipidea driver is not completely implemented. An extra patch series is
needed to fix that, but that's another topic, after that, we then could
add the attributes. Currently the sysfs attribute works fine.

>> +	status = "okay";
>> +};
>> +
>> +&usb2_1 {
>> +	status = "okay";
>> +};
>> +
>>  &usb_dwc3 {
>>  	dr_mode = "host";
>>  	#address-cells = <1>;
> 

