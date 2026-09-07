Received: from mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C744F30D9
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790359; cv=none; b=Zr7e0DYRSgYm5QZprLmL33wXaRv4IJpLXvRhAEcCd3mygsL9UIVJESs00ZdhcO9CgRzShdcHs05vM8jwcuZYXEBe3Ds9MM9TxeF8AYYE72e+CmCPcis5OUEKkmDV0QWjNEifsD3SrXsrpA/wpOL0QP0eKLP/lyiv0Og9Jzb5+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790359; c=relaxed/simple;
	bh=OQek3WVIqeFJXfSOZ70xWwuJ2WhXSEZoNQigwwI7A/o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dtImZ2vTg7uvS4KWAAt+aZo5h91m/L4m5+KdhCegWhzHuUJC42ct12p5D1z+PHA0MGe2Y4wyKd03QANRr8p7T1Hr4KZ2BboNAPYe+FtZKtcuuamtmgHoP8gmR0eZ/tJSN5jynCNZ7h43Lz/laKHeFZTF3F1ml7iKtXdKxJut+lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=N8z5QNqz; arc=none smtp.client-ip=91.218.175.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="N8z5QNqz"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=OQek3WVIqeFJXfSOZ70xWwuJ2WhXSEZoNQigwwI7A/o=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788790353; v=1; x=1789395153;
 b=N8z5QNqzhgHnaJ8THZZz6UFCthQFYUU3frR1MJ230AVH779mTy7CSiO0IiJKSPhPTM9lTHDe
 jfNgVIkVTgI8wW77hkc7zKFVydcuBc0kPIPTTfvb3O0fFFraLIlpf67nKYOLYXggHYI0Xlvhr0n
 G+cZ+SeVkQGx6F2kMF+nSgSKK9cs0cbGrWTYLf9RRzzrxvxW7dhwDlM98SMirerMc9dFBP76VrE
 f5GZ8Xilc3tY4kgUleMvRI1/3pf7By3deZrVTn7f51c9KfKtb9MUk1lEvWzsygOJzmD2CLyOnAj
 P1hFJU1dP9B02Ejvrh2hZoiTDla7qEoi6K6IKHOI86r3Q==
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e05ef1087ebab64e;
	Mon, 07 Sep 2026 14:12:32 +0000
X-Mizu-Trace-ID: e05ef1087ebab64e
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 16:12:32 +0200
Message-Id: <DL959BBXDOAZ.2RNX9SJVZIKPK@cknow-tech.com>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, "Heiko Stuebner"
 <heiko@sntech.de>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add support for FriendlyElec
 NanoPC-T6 Plus
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <sashiko-reviews@lists.linux.dev>, "Diederik de Haas"
 <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
 <20260907122406.1862398-4-diederik@cknow-tech.com>
 <20260907123459.B96191F00A3A@smtp.kernel.org>
In-Reply-To: <20260907123459.B96191F00A3A@smtp.kernel.org>

On Mon Sep 7, 2026 at 2:34 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing 3.3V regulator for the 4G LTE M.2 B-key connector and =
incorrect assignment of a 5V regulator.
> --
>
> commit 5412bbe217132fabf745d86e1c28d6b071b41043
> Author: Diederik de Haas <diederik@cknow-tech.com>
>
> arm64: dts: rockchip: Add support for FriendlyElec NanoPC-T6 Plus
>
> This commit introduces basic support for the FriendlyElec NanoPC-T6 Plus.
> It highlights the hardware differences from the NanoPC-T6 LTS, such as th=
e
> addition of an M.2 B-key connector for a 4G LTE module.
>
> Link: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6_Plus
> Link: https://wiki.friendlyelec.com/wiki/images/a/ad/NanoPC-T6_Plus_2511_=
SCH.pdf
> Link: http://everest-semi.com/pdf/ES8389%20PB.pdf
>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts
>> new file mode 100644
>> index 0000000000000..f23ac4bd9f167
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts
>> @@ -0,0 +1,91 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
>> + * Copyright (c) 2023 Thomas McKahan
>> + * Copyright (c) 2024 Linaro Ltd.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "rk3588-nanopc-t6.dtsi"
>> +
>> +/ {
>> +	model =3D "FriendlyElec NanoPC-T6 Plus";
>> +	compatible =3D "friendlyarm,nanopc-t6-plus", "rockchip,rk3588";
>> +
>> +	codec_es_3v3: regulator-codec-es-3v3 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		regulator-name =3D "codec_es_3v3";
>> +		vin-supply =3D <&vcc4v0_sys>;
>> +	};
>> +
>> +	usb2_port_5v: regulator-usb2-port-5v {
>> +		compatible =3D "regulator-fixed";
>> +		enable-active-high;
>> +		gpio =3D <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 =3D <&usb20_host_pwren_h_pin>;
>> +		pinctrl-names =3D "default";
>> +		regulator-min-microvolt =3D <5000000>;
>> +		regulator-max-microvolt =3D <5000000>;
>
> [Severity: Medium]
> Is it correct to define this regulator with a 5V constraint?
>
> This uses the exact GPIO (gpio1 RK_PA4) previously used for the removed U=
SB hub
> on the LTS board and retains the 5V constraint, whereas the new M.2 B-key=
 slot
> would typically need a 3.3V regulator instead.

The problem is that the comment on the LTS board is wrong and so is the=20
regulator name fwiw. At least according to the schematics page 32,
the LTS has 2 5V regulators:
1) USB2_PORT_5V (Plus has this too and is described above)
2) USB2_10PIN_5V

There is no regulator named 'vcc5v0-usb20-host' in the schematics. The
downstream commit that added support for the Plus does though.
But there it's actually attached to u2phy3_host, not u2phy2_host.

ad 1) This is what powers the 2 USB 2.0 ports at the back, connected to
      u2phy2_host port. The host-port -> phy-supply is "Phandle to a=20
      regulator that provides power to VBUS".
      On page 32 on the 'lower' left side of the page you can see it
      does exactly that.
      The MTT USB 2.0 HUB is only connected to the lower USB 2.0 port
      for its DM and DP lines, not VBUS.
ad 2) Pin 1 & 2 of the 10-pin header are connected to USB2_10PIN_5V and
      that isn't described at all in the LTS DTS file.

The USB Hub is identified as=20
0424:2514 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub

and in a WIP commit I have this:
```
+&usb_host1_ehci {
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+
+	usb-hub@1 {
+		compatible =3D "usb424,2514";
+		reg =3D <1>;
+		reset-gpios =3D <&gpio1 RK_PA4 GPIO_ACTIVE_LOW>;
+		vdd-supply =3D <&vcc_3v3_s3>;
+		vdda-supply =3D <&vcc_3v3_s3>;
+	};
+};
```
But even without using that compatible, it loads the correct module.
But in all my testing thus far adding that to the DT did not bring any
benefits, it may even be worse ...

I have a MT7925 M.2 Wi-Fi+BT card in my NanoPC-T6 Plus and while
Wi-Fi looks great (1.4/1.9 Gbps connection), BT has been horrible.
Similar story for my BE200 M.2 Wi-Fi+BT card I have in my LTS board.
And the most annoying thing: it's behavior is very inconsistent.

My cheapo (cherry) BT keyboard works fine/decent and connecting to my FNB58=
 USB
meter over BT is great. Haven't tried anything useful with that latter one,=
 but
it consistently finds it and when I connect to it, it succeeds. It even sta=
ys
connected \o/ :-O
All the rest? It either doesn't see it, it can't connect to it, or it
connects to it to drop the connection after a few seconds.
And after a reboot? No one knows what will happen.
I've had ONE time a stable connection between the MT7925 and my BT speakers=
.
Only it didn't show as a sink in pipewire/wireplumber so I couldn't actuall=
y
use it. I haven't been able to make a connection since.

My current theory is that the drivers are buggy, see f.e. here:
https://lore.kernel.org/linux-wireless/DL5P72WYQVOQ.23G9D01OY3BAA@cknow-tec=
h.com/
and that's for the Wi-Fi part which actually work fine (AFAICT).

The problems may also be caused by an incomplete description of the USB 2.0=
 Hub.
Dunno if a full description is within my capabilities though.

But there are also other issues with both the LTS and Plus board, like the
RTC being recognized ... but only sometimes. I have a battery for it, but
that doesn't seem to matter much/at all. (I may know why though)

That's why I mentioned *basic* support for it.
AFAICT it's functionally equivalent to the NanoPC-T6 LTS.

>> +		regulator-name =3D "usb2_port_5v";
>> +		vin-supply =3D <&vcc5v0_sys>;
>> +	};
>> +};
>
> [ ... ]
>
>> +&u2phy2_host {
>> +	phy-supply =3D <&usb2_port_5v>;
>
> [Severity: Medium]
> Could this assignment provide the wrong voltage to the 4G LTE module?
>
> Assigning the 5V regulator to the USB PHY port that typically connects to=
 the
> 4G LTE module's M.2 B-key slot incorrectly requests a 5V supply instead o=
f the
> required 3.3V. This could result in the module failing to receive power o=
r
> operating with incorrect regulator parameters.
>
>> +};

I don't have a 4G LTE module, so can't test/try that. But as the phy-supply
is connected to u2phy2_host, not u2phy3_host, I don't see how the phy-suppl=
y
for the 2 USB 2.0 ports at the back of the device could harm an 4G/LTE modu=
le.
