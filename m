Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A834AB01
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 01:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451523; cv=pass; b=ifg5d6NV/Uhmdg6+v2aUTbssDjasokfWkvIRNy4R0LUGL8Rf0RlKkZgwvW9iGgx1gTNEx60RUI0oQNuWOSHJa/BYk1ISpGweRkRiGtIKDwF6WOiI8/buZi61yN8B4GSCdE9QX+2rNbBd6VD6taA0Ck1vaYIsnKXaFdFP+Zq0awQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451523; c=relaxed/simple;
	bh=xwIME3S6OO3qgak0rq/F0HuR0AkmO+y8l9SetKzATCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0dt2RKJH5LgNrVzGU7rClcYui5XvNyGxY5I0ROiQf6ZJNBM0JkzS8gqJDxre+c9a+3GPgTxOxE1Ltd1Szx0tpI4QMNGvatqWSBj8L94rycTquUvZPnsNURzwOa2WqNfI7wi4ciQlKChp8vTBifGHkg76jj+6nGapuCvBE7RZhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZchJZLSU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+QKNlyK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZchJZLSU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+QKNlyK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65318QWY1260418
	for <sashiko-reviews@lists.linux.dev>; Wed, 3 Jun 2026 01:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cb0fWCu9Q4l+gOHftS8EITUxP/rLzMjQwTCSAHVbICg=; b=ZchJZLSUQ3sxzDPl
	1ay8RsFoUcrNffr5wshTn5HXM7kcLHfGkTqbJMUi9iPPSwliqVWwcV7uKhyrV7qT
	zoD57124YkHZAiyzLZm3zB1YK6iuQ4a3oak3Dv2x5XqpOAxjuHyFCJwh4mZRus2o
	opTPkeTw3MfX5YdNCYALi3QEtNrTfKL4SXS3tW+UukzBy5/cXh1F076VhSRoHjqG
	79jrvu8K94ixRryP8HUNLTwlSXiZ99bSkXUNuPJRiPNA7WMKzSpvo0T9H8AJJ7qt
	729ypC+gee8rkv1SQSExEEDMegeZRejPCchVmn2bXnU4IW0wMOY2FzJ/ksA9xYv6
	hkTTSQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgg49p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 01:52:01 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7e9369f8d6fso27318157b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 18:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780451521; cv=none;
        d=google.com; s=arc-20240605;
        b=I0zdlU5VZfbPqJUVkU07gaOC/LaTufpzDe0z2pAdE9GbhBXis1wCO8fYubuao8a8OF
         j2k8LwU3UTY+AdrFwJUHXFck/4N4RtQmoP2dk0ndLV26L08/a0+2xQqfHGDa0Qlg0ANp
         djzwWkKVe/DKeX7KKymw11cBqgQ8U0XFi8bL/OQbsrvpIcEtYn+gvXKatAVyVTbbD9kH
         noxfYLzMvNSKf8vajR7IQyEawhdjeA1YXumwkWppx5Ud2lm87NkXP+E+iYH0jPW0DtCA
         H1F8/iv0nULymilGYa4XzV8VlAZ2i8eY/lfk1Mxc2sJL9FL5/x8f70+bHI3t2dw1U0lg
         tpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cb0fWCu9Q4l+gOHftS8EITUxP/rLzMjQwTCSAHVbICg=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=isSE1Fs6N30L3uqL/cvPrZenFqQFZgapP4Ku7nmT/aCZaL4lwNLO318/fC7hYO944z
         5U9wFV61fkbPS4CQ1Av9GD5uNfTklnY/64xHCSQBRZ/MWuMZNE4r7Wh+uCO1G+i1Fhmc
         pgESQdVvnQ0a8jGUADzdOUUsHnTZzBuPA4z+VzXnQ2LnMIhvJmOJtN/XSKirGW+nqzdY
         MqQFQMez8kjus9pUdZuZxI4IRVoWcxYbWR0oOtJfUPIA5c8A4Cq7/yCDCaulmjLjFC4G
         wsda4xwEIZ8px/oXrYGXMercwG9hnRGOqXgW6wBn3QrblgjmtRXfr1xH5Hpfa2d30KdW
         TgZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780451521; x=1781056321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb0fWCu9Q4l+gOHftS8EITUxP/rLzMjQwTCSAHVbICg=;
        b=G+QKNlyKUBwdQZmqWKannqqiWQ+RuDsPa+vZl7pmYUD7QJJjFZxPHu0hTAyqsuQVah
         EBoZGX0G3oBYrprxBNYJ/iNiIm1iQB8CB7Mtl0EGHNMvbJuX7C2gI4WX+wxeTBPnE1Vm
         jZtpFN9sVzWMvvADSoAIfoJqY8o7nWArM70jA54OfrqW6UFpJg5MQP8M6Nlp1f/ozNK3
         +vaw+xxHdYC7q5i2jpYrenUFhQiKx2oNLb5oDC29J+t8LqOCyw4aCbgHor1KFa/s5Gmf
         u1w9tUwM4rxh0GmtqNA4JOiYtM9aNKY8wsoJxB/4Nb1q/cUyGUZvyOa0cSKF4/Oab5Gm
         +njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780451521; x=1781056321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cb0fWCu9Q4l+gOHftS8EITUxP/rLzMjQwTCSAHVbICg=;
        b=qG1oeoH56TY84G89l/euwiPU1wlE1shDSvoKzjeT4GTRMek927W/WRzt3+BrsMDnAn
         ZhL5XKVUnZR3L3A+2E4JMoJeNWiocQNODdkX7zgBBO02lZbcFM6vrhWV9gRHWKpceCEz
         BVV9sDeVAxwmPY5JPBLHNt/lNMtUmlJpFlK9++D+lDW1Dh2iy/VkINA9hriWiht8EN/r
         xp6HwkZyACwi1+khwGZuPuxrETVkE8oyGZoG8sE0chW05+iGGxwB+cPVj5zl5rOwo7Pn
         38rsbxYRrcr6gw1Qlo34D8I+jp8uTKIlnZQ59elB1lSdx/rEdWHFDyfc/1WBARfEE8Na
         EAog==
X-Gm-Message-State: AOJu0YxkVKP9sAB6XMwU4X1Fwa2ZgEzRftdVaZR8CdDNrHxBNwUEXFIa
	N5I4hVQEOQJC6ZQ2XVSRwOK03sfPwk1VrZnIF6iFxg4FQQ5U5iuYpv0CHTx8IeGmJQ/BKzMw+5U
	MaULH4mrpBn+3rn7kv8+X9phvzLm74Nt8V4I5iq/1klANlj07EX76RXKX4ODrpCm6kdI93s8oe0
	n4Bo+sFDtCPtZNkM81SHsN+4tjYeL61F9thFyui4O7BNjv1D1x4Yf3oWkrN3UPvQ==
X-Gm-Gg: Acq92OGMbIrkHLTrKGXarz4/Y9r3Ldlbf7GUu4IWz0nKS7qMHuiH/BKWxbDRfAHG7r+
	qo5f7bXTbxnqwOCIov7kPXnvhv418qdgBtsv8E9qv52kOezJsn/djQRhNqsh7waRv2+nuBQTdjD
	6HB8T/KECKP1aRE06xlbDNxjRoQgrdo6LbF8ZWsFAqVATzHTLSpBeKgRbYKTh2oULLxTddTpQFa
	Vbdzfw4BVi4OSR0dQ==
X-Received: by 2002:a05:690c:62c8:b0:7dc:8dc5:debd with SMTP id 00721157ae682-7ea4730bd83mr13875417b3.8.1780451520715;
        Tue, 02 Jun 2026 18:52:00 -0700 (PDT)
X-Received: by 2002:a05:690c:62c8:b0:7dc:8dc5:debd with SMTP id
 00721157ae682-7ea4730bd83mr13875287b3.8.1780451520191; Tue, 02 Jun 2026
 18:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602071028.3810-1-qian.zhang@oss.qualcomm.com> <20260602072153.338AA1F00893@smtp.kernel.org>
In-Reply-To: <20260602072153.338AA1F00893@smtp.kernel.org>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 09:51:24 +0800
X-Gm-Features: AVHnY4LUiDgPjO83-ZR7PtFItOOqQIQFyDIil3QPK_fcYeVD7ZGpDCeT8J-F2do
Message-ID: <CALC2J1NuM8XnytwBNtXuZduBUtmqzS0_WDOk0HK6xsiX-pAKAw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a1f88c1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=g-pP9vhoa3iisoDEgt8A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: RPx96QfZ2seupY6DPFYlIIT9vO5QUoEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAxNSBTYWx0ZWRfX0tSQsH45Fpmd
 Y/H6X6ONLS7hOJd5X16py49VbeFqFg4N1LZTTfG9q0vhRKbmdOHsqW65u31VAqHiDsyUmmujVPD
 4DjAGIPJVttkOuO2qFjM177fQ7p5O5urOqtxjvg8zRcMUfHQ2ygdXMlbXRM/vcsTAB6wkTW4Hkg
 1xGU15+37f26/AHIs6uAn9qUhpYTS2v2vodUAusa0cICOkpLnjYIhRsVs9rEnE4cUUK3zusx8jB
 a8l9BZ+Qb+vGHpV5SwIV1VqHu9wbTVkD1oPpKfxBSbP6Cc3Wbg9TYj/jaggz3E7gfjDvzpZXuz7
 kcI1B491vSWKPejh8ghR8/SccpO9J2wA/1VuCXtjq+ZHwlbSR1T3o71G/CxffqhUkJcjzL0GBuH
 UMPjmgkfWMDo60oY0zyq+od8ELY5H6oimlEmqp/7405rWZZcTflk6gjrGj8Grhix4HkCWqTJhE0
 xWmIbEKIw/zXCT0waMQ==
X-Proofpoint-ORIG-GUID: RPx96QfZ2seupY6DPFYlIIT9vO5QUoEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030015

Sorry, the previous patch is incorrect (sent wrong version).
Please ignore it, I will send a corrected version shortly.

On Tue, Jun 2, 2026 at 3:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `shutdown-gpios` property for `wlan-rfkill` is incorrectly c=
onfigured as `GPIO_ACTIVE_LOW`, which will invert the rfkill logic and disa=
ble the hardware radio when the subsystem attempts to enable it.
> --
>
> commit fef17fc3948ff81196d4df1a40b32c0d905e0ab7
> Author: Qian Zhang <qian.zhang@oss.qualcomm.com>
>
> arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
>
> This commit adds device tree support for the QCNFA725B M.2 module connect=
ed
> to PCIe0 on the Arduino VENTUNO Q board. It configures the rfkill shutdow=
n
> and wlan enable GPIOs, and defines the internal PMIC regulators.
>
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/a=
rm64/boot/dts/qcom/monaco-arduino-monza.dts
> > index ca14f0ea4dae6..b90397c7000e3 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
> >               enable-active-high;
> >               startup-delay-us =3D <20000>;
> >       };
> > +
> > +     wlan-rfkill {
> > +             compatible =3D "rfkill-gpio";
> > +             label =3D "wlan";
> > +             radio-type =3D "wlan";
> > +             shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_LOW>;
>
> [Severity: High]
> The commit message mentions that pulling GPIO54 low disables the radio
> transmitter. Will configuring this as GPIO_ACTIVE_LOW cause the rfkill-gp=
io
> driver to inadvertently disable the radio when it intends to enable it?
>
> Looking at the rfkill-gpio driver, it treats shutdown-gpios as an enable =
line.
> It calls gpiod_set_value_cansleep() passing '!blocked' as the value. So w=
hen
> the radio is meant to be enabled (!blocked =3D=3D 1), the driver logicall=
y asserts
> the GPIO.
>
> If the GPIO is configured as GPIO_ACTIVE_LOW in the device tree, a logica=
l 1
> will drive the physical wire LOW, triggering the hardware kill switch. Sh=
ould
> this be configured as GPIO_ACTIVE_HIGH instead to match the driver's inte=
rnal
> logic?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602071028.38=
10-1-qian.zhang@oss.qualcomm.com?part=3D1
