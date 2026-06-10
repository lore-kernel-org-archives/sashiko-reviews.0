Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169343DCD86
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083617; cv=pass; b=MeJSAW+rr5nn59kHSMQXjCct966R+s7zMdxpTjMkq0RXOYXSFd5FJkLw/3adq4wcFe8zt3A8A7DH8TpTmRGqLHeOyRW9/lEQPSfAo3AlnrZwaxEuIJPBX6Ru7o5MOv1rak7MzUH9aWRUC3JaqifK+sakPyOhcj1kaXYYvBGw3hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083617; c=relaxed/simple;
	bh=T3gJHGOV8CRi89pERdi8prAy/O5EkH++lIavw7aP4R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deiLcJRKyElEeSm6baLMpFV8VlrD4FbG1a2J/Ksh2FYR9HUlFle1KEo+wAKpXHoCxys4YAFcLe/m3Hl29tLaK57PVo2Isw3+FPqtgZ5TbsptLYUs9qiGlsuZf5b6YatxeVFco2hJjM+FeyE3kpXTRzb4T9aI3/o290Ro8hanV98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FknOF9iM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQCZ2g1C; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FknOF9iM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQCZ2g1C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hpNU469561
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 09:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFk7Y+3XJuKNEXnnDZO+M/V8DgBSGCpZvdYQCl5/IjQ=; b=FknOF9iM2vTQiT2l
	xFlH1mloI9/jWKlw3nVEguBhv0tctQ1748tCKhLAvfpRLTdcTzCCCcjrZcGtz206
	xKqraF7DoAlNmr18AtUfZSW6yjUAkyJPX1jQ2f7miTKfHiHDikrqynYXZcq/UfYP
	9g5DRhiiuU+9I5M4oXnuIrvcZcQUvKxE3QEaSXn5IIcaSZSO+i342lCrMQFJdswa
	okEo0C7fBYdVEKvicoArRLuicNKqhZB+4J1Fs9euNOL8Gb8A0JqimyflaR72do0F
	a8jxoc/Grhh8qUENyhxiuHkmJa5pBIh35dSXUJa1tPbWOxEc1yNNqZMlh2zunGkO
	qbHMsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvhg2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 09:26:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915d3261c5cso740590485a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 02:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781083612; cv=none;
        d=google.com; s=arc-20240605;
        b=kZ1yuVCccMqjejliaSx/GwBTr2g1aaqjizuQr1VqgNC/eoauwROljoTemU0adG67rp
         BjOrD5NvtRzLlWbfi7NufO7uNwY5kuQ5JExr/rNMkx+2LCQbh6k0sUzQ9GE0kHkQGqMk
         Sab/xpsTpyNxkghj6cn08ksG5vdsrBvQf3RwFTWuvkNarlqC8te3/gxSksFrqHICxd+C
         FfAR1ln3ZD08HL4pDxHlgxNz2oaEGYDoPoB48hsUjbK1OCnOEOWxYIUnMfjUkGUBUlQh
         ej12L40yGSZwrGyck3ufbMzLKgSj5WS63eoWzvqb7K/JnN9w84SVsYYmTr8H9AJMokvz
         Tm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFk7Y+3XJuKNEXnnDZO+M/V8DgBSGCpZvdYQCl5/IjQ=;
        fh=OT1h8NHeGiaeR/cdsN78G2vJ2398amNdum56pfxgDFU=;
        b=iyiPTRdymszJlmDLRAOJIpRZf7ywL2EJ/hkUO/GXuXTH8YoWhuecPYPx3EQM7op5cG
         GZT68Jv2snZezc8dKB2bYC+Zkwzpzs88GaFGQQBVuuoFU+yilRu3J6UnA8qQVvyC2gjK
         CenLGXUJwObgm8zEj5K5WOh3bNIf/soz1Qy5a0PbclA41A+FmVl7h+jAOWn10Y621tFY
         3WfH8G0PaIR9+RBEyFekCNzSjNxGxDYFrRvHdLJaOSNOepk/t9XZT8icq6qow4EpNnUc
         Gj9mVzwNwDQFT4c+RmJN0rnscct+iUyeXZKpgwF3gAW8nR4ut5AwHjrV8Ltl7hWPwqQ1
         s02w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781083612; x=1781688412; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFk7Y+3XJuKNEXnnDZO+M/V8DgBSGCpZvdYQCl5/IjQ=;
        b=TQCZ2g1CwG9Xjr6wAHEy2SQs7XiH4AoEOOvRPzyFN4mlu4vtnJZmaQNi3EjiN0u6Ov
         nJQW6hwB/6m6BxSDax15P2BJ+WoFQ3iLaZ7uO9unNaEGxfRZ3MZ7TRUzPm/s8aazSRh4
         4tdY3Zclvwzuz/LtFNN6G4ZnFSRcZ0gVcIrXr4we+C0BZWNKDcvwcjOYr/aRSLPoaCkG
         6MKsyoGrHCg6PGBntBvQvXay9xkDzx67TbZRmvUyVfJRqzKSSB1Nj1wCvMgBd4OJxO3v
         9Qym5Toxpdb41Zrn2hWY6ZdOP5vLblymdf61V2lQpYHrgYNNVN+T4KiDyhPoXISu99xp
         uXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781083612; x=1781688412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFk7Y+3XJuKNEXnnDZO+M/V8DgBSGCpZvdYQCl5/IjQ=;
        b=A/1ZOnxm+wjRjb9qIrsoENzL8SXDyYGzLkvPSmxXt2FRaF738fQTpKxnHjG3jHvtLj
         a0hOanGQNv0e3rDIjdcdLyT1Tx2DraebBpOcGciKLUXSlOR25OOb3IkmyUc0E6/brMiv
         2TCSvmFBMwNzBq8fYz8xr3qYMRFBEZcf2ulP4lVBtbZqWJx8RwRdNoWWmES8pJ7eESkt
         t9r4PSsLTkzB6+QOdj8XDvMwSSSNzYVFn+haArbKXMkoqzjodhuFqu/oiqqzeQM1zhEG
         HR0GFHPVa44OQUzzsFOPqu5P/Zem5PjAEaG1yQR0CFzfYfwubw1KmSkH3obJtdjOXYYL
         2new==
X-Gm-Message-State: AOJu0YxzHNPFxoPM2OcVFpu6vMkYpJFErkPImeyBzYqzrlfKk+H4K6eP
	J0qiqdW0x/4zr/L/nnYqClW8SoFGj8zpXmfFZSqx1AJdT/DAmOotWfDm8YFu448nS7j+o9rpu4q
	mZfhv+Nj9X9uy2JS2fVDmLtkVFxO5/2CbCgRZjr9KzBEZg4b+NUNF/aF0rTAGrO0FK2yQmjhXKP
	xB+nefJKHW4afvwjieYwwLcSMbDNZDH+0m6EdwftUvsGO6UXS0p8QDufv/OWk=
X-Gm-Gg: Acq92OE01ezvf128ee6YZOq2fuELCkUJTo5JDJtYlbyOIHKiNMLHPnpKU+T+FuyRLXB
	RU+5Fmz1jt1qWEt3PhX2sKd4m5w+xDdcYtl3lvTsTM4KlCTfcAaXO89dMA3ErnW2ljABc7JqDWE
	YSuNQlpvpgOlDSNtXOAms3N58NGErmdjzOVC5nl1OO5jq6otct1JDMwZHw6NSYULlMWNeeEtmeC
	FKNmxNvaVO0HtdkRyL3b6MScAldNJnlSg8Bbv8KTZ/wo2my7JiPhV6MVyJPDJHTpap5l31BIz50
	ix4pHdzQVO+t87K5gg0ynViTpEEqCGsK
X-Received: by 2002:a05:620a:6505:b0:915:7c1a:1387 with SMTP id af79cd13be357-915a9d58a9cmr4143010285a.38.1781083612031;
        Wed, 10 Jun 2026 02:26:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6505:b0:915:7c1a:1387 with SMTP id
 af79cd13be357-915a9d58a9cmr4143006685a.38.1781083611572; Wed, 10 Jun 2026
 02:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610-monza-ina232-v1-2-925b0d12771b@oss.qualcomm.com> <20260610084357.C62271F00893@smtp.kernel.org>
In-Reply-To: <20260610084357.C62271F00893@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:26:40 +0200
X-Gm-Features: AVVi8CdxDJZU3I6sOC-ENnBzyF_VWEQDK9FUcNB3E2lEochNP19iI-pGpns_wH4
Message-ID: <CAFEp6-3C0-g7P1m_0xNJj+uEqKJKKuoGk+LspzJgHxh8PKnfFQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwmon: ina2xx: support ina232
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: mUd8xWj_kIDnNTX8Xuviiv6eGcDiaVGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4OCBTYWx0ZWRfXxKyJUTWFB7k6
 arSoUUyfyp99ktUzGoEr9LtPybsuDyxmUmM512o0mV5zdrqFzI9WiW8KO4KXBU4PgDZhbsdcs13
 vWrq5xEu1jqMVXuObBn6E8Gz9NUlxsNgCz/PpMFcNpXMznojwU5gtGr3LHNZxzOrpRLSpi+wAIy
 WA/t1WcBbsIOb3VmmGlzOmmDXJhZp3rB9owI8HoG4isUggookYbtmrMW134IAQekgUrKrfP/u+y
 RAxLPEKmfX08ZKbqGfaT3QDglYvlrvneEoQc8MEuLaj/+IYKSaAse5123q5Gwp+59rR+F/N+oW0
 QA+v50A1MwFdfhjwtNFK7kiC465MRaO+SLbP51GCBOa7V+wKYrGdSL+LPsbf+bgTo8/KCOsNtjZ
 X6+Yh7UKfbxL3d4QIjKjLIZ55rrmvXWU5JdX38iYQEGrMGI0v0sA98iO1hQHJMkhmxiyli1kIRh
 9V/T9ZQtorFeLLw2+1w==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a292ddd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=MirW3AXaAeI-T4zOSt8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mUd8xWj_kIDnNTX8Xuviiv6eGcDiaVGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100088

On Wed, Jun 10, 2026 at 10:44=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The INA232 configuration implicitly omits `.has_update_interva=
l =3D true`, silently disabling sysfs update interval configuration.
>
> Pre-existing issues:
> - [High] Multiple alert limit calculations in `ina226_alert_to_reg` suffe=
r from integer overflows and signedness mismatches on 32-bit systems, causi=
ng hardware limits to be incorrectly programmed.
> - [High] Integer overflow in power calculations inside `ina2xx_get_value(=
)` incorrectly returns negative power measurements at higher loads.
> --
>
> commit 553d30269962c93d687fffb0c6e1dcc15cbdf020
> Author: Martino Facchin <m.facchin@arduino.cc>
> Subject: hwmon: ina2xx: support ina232
>
> This commit adds support for the INA232 current and power monitor. It def=
ines
> the INA232 configuration values and adds the device to the corresponding =
i2c
> and device tree identification tables.
>
> > diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> > index 613ffb622b7c4..122e7aa4fdfff 100644
> > --- a/drivers/hwmon/ina2xx.c
> > +++ b/drivers/hwmon/ina2xx.c
>
> [ ... ]
>
> > @@ -196,6 +197,17 @@ static const struct ina2xx_config ina2xx_config[] =
=3D {
> >               .current_shift =3D 4,
> >               .has_update_interval =3D true,
> >       },
> > +     [ina232] =3D {
> > +             .config_default =3D INA226_CONFIG_DEFAULT,
> > +             .calibration_value =3D 2048,
> > +             .shunt_div =3D 400,
> > +             .bus_voltage_shift =3D 0,
> > +             .bus_voltage_lsb =3D 1600,
> > +             .power_lsb_factor =3D 32,
>
> [Severity: High]
> This is a pre-existing issue, but can the power calculation overflow when
> using larger power_lsb_factor values like the one added here for INA232?
>
> In ina2xx_get_value(), the INA2XX_POWER calculation is:
>
>     val =3D regval * data->power_lsb_uW;
>
> The result is returned as a signed 32-bit int. For the INA232 with a comm=
on
> 2mOhm shunt, power_lsb_uW becomes 40,000. When the 16-bit regval exceeds
> 53,687, the product exceeds INT_MAX. This overflows the 32-bit signed mat=
h,
> wrapping to a negative integer and reporting erroneous negative power
> readings to userspace.
>
> [Severity: High]
> This is also a pre-existing issue, but do the alert limit calculations in
> ina226_alert_to_reg() cause hardware limits to be incorrectly programmed =
on
> 32-bit systems?
>
> For INA2XX_POWER, the upper bound is clamped:
>
>     val =3D clamp_val(val, 0, UINT_MAX - data->power_lsb_uW);
>
> clamp_val() implicitly casts the upper bound to a 32-bit signed long on
> 32-bit platforms. This results in a negative number, meaning any valid
> power limit is clamped to a negative value and ultimately programmed as 0=
.
>
> Similarly, for INA2XX_SHUNT_VOLTAGE, the initial clamp uses SHRT_MAX *
> shunt_div instead of division. The subsequent multiplication:
>
>     val *=3D data->config->shunt_div;
>
> overflows LONG_MAX on 32-bit platforms for high inputs, wrapping to a
> negative value and also programming the hardware limit to 0.
>
> Additionally, for INA2XX_BUS_VOLTAGE on parts with bus_voltage_shift > 0,
> the calculation (val * 1000) << shift can exceed LONG_MAX for limits over
> ~134V, wrapping to negative and setting the limit to 0.
>
> > +             .has_alerts =3D true,
> > +             .has_ishunt =3D false,
> > +             .has_power_average =3D false,
> > +     },
>
> [Severity: Medium]
> Does this configuration intentionally omit the update interval?
>
> Because has_update_interval is not explicitly set, it defaults to false.
> This hides the hwmon_chip_update_interval sysfs attribute, preventing
> adjustments to the averaging time despite the INA232 sharing the INA226
> register layout.

These are pre-existing issues related to out-of-scope voltage and
power values. They will not be addressed in this series.
