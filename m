Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AE382F18
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 01:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451539; cv=pass; b=Q580ketVCBojjV5oMvKmh3iw0+5heIO9mtQap6MqKgULI1HGSNJCSUnmABCk1WUri8a78WhzvRbyu8oagHXbcpDu+y+rwCtXGQRbCqkwe6HqYuFzkSvK9xJFpHPBKrRxiQM75+C1hR4i4NPK4MtsZSdHM0Iz4WV8Qp6Y8sNlm5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451539; c=relaxed/simple;
	bh=E6JvOgQV7Bmt13obKxm4OfMG+JC8GEWWSMrT7CakhmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AID2j3eFrPLi+BhVhxkD5eFa47tAAYBZd1lbnNFh2rWWLRQW417QW8mqmFC8IT7fppSrdogmDYFApzaDwHK7aLiVhMQYUOGEdw4jRzT/eGCnWjchDuUKQRtQUWRGYYPLmvPW1oNDe69mwlViWtqj7Wo7Cz87FuQ6vmaTSOJHcBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZW9bTv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9iGnG9y; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZW9bTv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9iGnG9y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65318EZK2388904
	for <sashiko-reviews@lists.linux.dev>; Wed, 3 Jun 2026 01:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20YEdzy7J37X05bS3dlnzzLukGWboG1hOMONXXVmKzk=; b=nZW9bTv4NQLFgxHw
	UQjl5ZVrg3TCuxv5gu9hcp/di+VDKFuJHLFITgpEzntT7gislx7qbBeToY2MxIk/
	ivrxmrzITBrlr+S++AoYdCdg2I+ClrIJnuao2wdx/yHwB1Ky6bDzaqb8iP5Q2rWH
	4mE39UNCYroe9RdcLS5BNp59VKgfKpykoCUkBKAGSm/frD/MIzkwRYjI/PikMamB
	IyfERYIZ8MoPWRJaGzXvZ5nQ+sA9/OX4sqc+Fhx5TZh4MnEZP0s2ubAaTbP8Cgl2
	5BtP1/MvfzTGAjDO4mRInehgeXcKO4Vh+Rp2NY1S7WOYnE/ms6JQ9dCqyOd6NmIY
	R1zBdQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbr4k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 01:52:17 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7df25ce3000so92657647b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 18:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780451536; cv=none;
        d=google.com; s=arc-20240605;
        b=AO/F2EOfF7FkulpLuVAV/kWNXvpxW6EyGXnl8CF3bgcjH4LjTGAJXa1OgAZTNf1Mg+
         sXWqR0HVorGMOXRD9VeNhAJaHmjEC2VeOOeFwM4SM3x/eNoxWFT1/ebzxVincU6Rh2CW
         ksGVKsK/UdLy91ig7kThc4Oqb2PNHUC+wU9z9PvLndl3bhponHw0AMKIFDEu+teP0h4+
         JB/eFiOtVpddoMla4+vbiDIJN+NVpA9Rlp4TnJE04f7UzZYydu/qPDMq0l3Epx+30i+8
         jgvO+uBWkBdcvbagr4nFCWUVgEtK3zcJDbDF0GjLeZakUBy4+1wXdsT8iAAebjzTJa+g
         USKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20YEdzy7J37X05bS3dlnzzLukGWboG1hOMONXXVmKzk=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=hS1cG9IRJad0IxGJTNdnLTQa53siugkdVrnDEJt785e5wsPgMyJ9ekyclSnEdUf9Bx
         i0rzN9H48XPKafL4HIy0DOssoL5AW8gMcE6/BS6VBOI4BWy2EEj7SKv9rr5YhJ4rZnxH
         +xNiMgMo+JvumSKy4WU4SWkvK0Sej2cj/+FXHKRjS0FxDxBmYhgWvapeOaclNqh8AvJd
         ll/POFhsOwitV+oM7f8XH95RwVuvptKKF96WI4AHMt06dyP60wMNZKc2qMnO5aU21O7f
         z9FDh3kqv/xVTpZcQ1SrGGBEKgVa9gNqBdnxBDtXtQdHAANNOETgd7rBDhJuu/qBEGEB
         ozVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780451536; x=1781056336; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20YEdzy7J37X05bS3dlnzzLukGWboG1hOMONXXVmKzk=;
        b=j9iGnG9yjvhMOMbtZr6O68MYwqL8Wokcr1A/5CwJJ9bDBr1GbAcl6Gau7CEoRJo/JQ
         VuH4JA7wfKUyMPvyoBk/TmjRDdlxKJ0F6XA2hDJsT6+QiGEOvP7phrKlzaTyrZXMsfYf
         9wC/2MSTBORfPI89xthORXAY4yJdbAl85A7Z4/xvRO6gOaB8s/9FfxzMgO+tK0yqDYxy
         CxXjOBefC6H+w3zDSYTiI7vL1VQaVeUUkoJ9WLJuFQKnzGqupgvUThuNo2SKgS2XXKEK
         6iORc/ARdtJsPJskOf19K3rOEPBYloJp8AhCI+MrsmT+PFbJ62hXYpV97uCcjU3SLU3L
         on/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780451536; x=1781056336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20YEdzy7J37X05bS3dlnzzLukGWboG1hOMONXXVmKzk=;
        b=iQbteU1rxMExmaDmj8A8bzMY9Oi+um10xuYepVKBFX8s6gZCyW9ClISbcNY37PgBUB
         E/2ZsYqMon7dV71tzi5s5mIxcHrsLTYqwlkifZuQNNf8cTg33YBuiISKLFZ3/XMg5HCS
         INHKmjI/EYh1VcTjIhhc10ZjY9VetHqyNw2zxmUW7SFzryxZBc5x2HHkC2x186CIQuQ5
         KrjBMSDmiNKVZWziAk6UHMDV/sfu8hHscIsuOl84Kw+9bRHmDSIgd1WaRtLfPMP2ejcA
         iuQ2Wr1Pd/XDUmHDVld5CpARdCvnRBzw8aCEvuP/EgieJGLbDlJiIMVRY60Oq5UYoYrH
         J58Q==
X-Gm-Message-State: AOJu0YyyE+Kc+8d+Lw7ybP5x6PFr2/obb/45AubkxQFSxEI9HgQGrM8Z
	/hubHXBfZq0bbjtA4KT3liTVXbhDOObFzxgwBwXFkT3uCnulmZHdE7DahrnIKl2p0vNIA12tm/W
	WTqXDulmk25HL4j5H0cQnuuG86KTZoI61F5ad8quWCwuAnJAIEfR5lL7FHp90jwXG7x3c5DJ3bS
	W+wwEtR8qjYdWgN5bsK6lRgD9hy3StbTDEUQI9NmALyg5HG3XQTiXfOTbrDmDv3w==
X-Gm-Gg: Acq92OFu9NOaMZzfb48m0N/3VsmedUsEWoBzXssGCmONytFipGGULNEP9gbDTpEbBnL
	EuZXHGdfhxw5IZf16oQ5ZR4+2+JRDXJXMzzsz73b/8WSbPQTxlzTKivKyDxTWGmPznTYLZiqOet
	Z0hCwreg51KT0Ii1Uj+vkdh+n+wl8Hh8/S+pSCX0xuX9l4nHvYiHnH7V+R1ZVDVBMmYdBRvzBEq
	dycQqZiy4Sgc3PmQA==
X-Received: by 2002:a05:690c:62ca:b0:7dc:25df:cf29 with SMTP id 00721157ae682-7ea4a6439d5mr13117937b3.37.1780451536337;
        Tue, 02 Jun 2026 18:52:16 -0700 (PDT)
X-Received: by 2002:a05:690c:62ca:b0:7dc:25df:cf29 with SMTP id
 00721157ae682-7ea4a6439d5mr13117787b3.37.1780451535862; Tue, 02 Jun 2026
 18:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602070530.4194262-1-qian.zhang@oss.qualcomm.com> <20260602072137.794E61F00893@smtp.kernel.org>
In-Reply-To: <20260602072137.794E61F00893@smtp.kernel.org>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 09:51:38 +0800
X-Gm-Features: AVVi8CfotaJLlnuGfvA473UR7dwf2nlSUrkKW9CkVYGNWbt9xEdXbK_KGiJff3U
Message-ID: <CALC2J1Pjj76Pp+PLucS0uUqp0NKWU8eYvHVR8u9wzVm4Hzqd+w@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAxNSBTYWx0ZWRfX439YcGw/aBMw
 Z+5a9RjMfM2kmUUWtpvgxE4/OGBT5C8uOfBLVFV+hLyqJSawilyqeGaTIzuIn1BLOqXTK5B+USW
 SRcAR1Bev3FmohvRUtKx7hulqV+R5wyBre9UldpuvDbJxf+9OprRuMRoentZ5ct3J/Hk2pVKr1u
 GG0PIBAks5jERlgg+MA7qRAPpL134ddqAdaLYrZMYuzSLZaORHBNbzjyvTeV7L0i++P6teQKbGF
 Qhma4ScK7C9eLpvlPVaHg0Ia+U7NkUec4iqqnRXkMlBuLP7nKFTQr+VsSi1WhXEOJvNRPFawWi8
 xmqSLdDlr+gHNzA9f7c7OoQ0A54tYvRZkf5tm7w0+fzlPHZyfLJZSHMQxo3yZGIieTsWQploaMd
 9TkN4iWWQhGfCKIaUw2eMt/zRoTArzjlHXyI8GsYasojIlQGolCRCVLNg1hcGNHFGu+sfB+maDz
 G3lPpIoz/U74OeUXxcQ==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a1f88d1 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=YJzTSrPj2WyKA5JjjykA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 8lL4N8oUTObuvriwvanwtNG_5hPfIV4O
X-Proofpoint-GUID: 8lL4N8oUTObuvriwvanwtNG_5hPfIV4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030015

Sorry, the previous patch is incorrect (sent wrong version).
Please ignore it, I will send a corrected version shortly.

On Tue, Jun 2, 2026 at 3:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `shutdown-gpios` polarity in the `wlan-rfkill` node is logic=
ally inverted, permanently disabling the WLAN radio during normal operation=
.
> --
>
> commit c96c608f286f34bcc2c474aeeb078a7d4cf17161
> Author: Qian Zhang <qian.zhang@oss.qualcomm.com>
>
> arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
>
> This commit adds support for the QCNFA725B M.2 module on the Arduino VENT=
UNO Q
> board. It models the W_DISABLE# line using rfkill-gpio and handles the mo=
dule
> power supply routing through the PMCA6850 PMIC.
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
> The commit message states that pulling GPIO54 low disables the transmitte=
r
> at the hardware level.
>
> Since the rfkill-gpio driver treats shutdown-gpios as an active enable
> signal, won't setting this to GPIO_ACTIVE_LOW cause the driver to physica=
lly
> drive the pin low when the radio is supposed to be unblocked?
>
> When the radio is unblocked, the driver asserts the GPIO logically. Becau=
se
> the device tree defines the pin as active low, a logical 1 translates to =
a
> physical 0. This would disable the radio during normal operation and enab=
le
> it during airplane mode.
>
> Should this polarity be specified as GPIO_ACTIVE_HIGH instead?
>
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wlrfkill_default_state>;
> > +     };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602070530.41=
94262-1-qian.zhang@oss.qualcomm.com?part=3D1
