Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC84DD3B4
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168696; cv=none; b=ByFbntH8+YPAP3UDeuYIJ7SUTfuOhOthuMAfgnN/EvnONczcw2EltWUcaGdTChq23Ykbmb0mcx0KDXq3w6dknYLFxptmYbA9di+XzGdC91Szjz9NyjEdlznt1EX45egfLAS5tCAT8uArlz2f0TWGWnv5Fx+I/FASdEfSzaL953M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168696; c=relaxed/simple;
	bh=NRUGg5BizThFVRqVbbTcHF3tOAyh4FWCybNHMd0g2+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBZBCjlG6bICIgq7JwsJb8KJoahfw/ho02cyCrTy4RcaeLIf0H5XQvWGpnNLY30pSBB8uBA+Phr8K2XVha9PN5ImKRshMOQw1BEI3pJ7PUT5KYiLyW3zkVeSrIvrEJ+deWITn/8itScFd+Ah3KlRxksPpUll2Vx8vmMC8S2lM9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROLPTCKx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q85wvS4D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROLPTCKx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q85wvS4D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBcnIZ3161354
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 13:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5f+Tif/jg8DaweC4gQB3SQOyd5nkuWXLZR8z1vD5tw=; b=ROLPTCKx41a6gjh8
	S1BoiHZboeqL9em5GH9tfHOQW48yLXWSMlJMRLZUEpLH10XA3V4m3eWHkL+dBt0r
	Ph3ioweelzCiTzQ1ndlPHEnpS8xlwRWhhFPj+QjPGzsnCyhSkFTyxVEckInowNXL
	QHi1ptfCtFv98LVmLNeVxbII12q03lrFVpCcULBO7NCI64KmTJGz9GW5JpMoLc3T
	jbrqtbZ6bdG2Hjeb99eDwBHRK5wm0RGMAzQuarw77/4lG+OwWsw3DqwGNbQR71mZ
	PsvuQMWDw01ZK4EbuKMoos2EXd0Tcg1iYeFBK0vX4H1Gdx8dNksVevRbE0AjK8w7
	xn4/uQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qty33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 13:04:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so6195615ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168692; x=1790773492; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5f+Tif/jg8DaweC4gQB3SQOyd5nkuWXLZR8z1vD5tw=;
        b=Q85wvS4DOEg+exkRoP0wBAM592buS5Uwge0rnnHyTupBhhCVRVYR+xMIqAFgtmA7x8
         enzpPAeaFKgMBQw9VgWgKNlMy65ajpFdC9xkl6a7CKJiN40hh0/41i1kVVy/qeqlQy/f
         u8EoKsRIFiEdl0n8GNwPHWjGP2l6696MXrIgHq+gKQlID2uOhXPK9UgbLOstsxwgDxUm
         ptClwJIAS6xMJFRX+AdmaX1lNIjUq/UmGCXWP2ILCA+tZ35SIO9q9EjzUOyVXO8HRPBe
         uhM3X0Iw8X3Rvc7yL+EV1ZHxh93nF89nf0lALut3JXbv9IsJ8SP2qOa/6mMdqmdVgQRv
         NWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168692; x=1790773492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D5f+Tif/jg8DaweC4gQB3SQOyd5nkuWXLZR8z1vD5tw=;
        b=gwNbzTtlFotKRZi8+PsK0iUH583B9NPhN+uj3/aXLQHq+L5TBIUdNjhzmcwYWbaa3m
         aBDDT4kHJs1f/dOM5Iqu8bv7GOHeVHcsVBKH1bXU2McMoIWBaRUVQKj63HRYWzfBy94e
         hm4q1hEU4Fca6K/WjxvhR/a4zftjGRU+MxujCnWp6H5uZizo1Ze+fetXIxxh8Wk0vK1H
         vFvwIi7ywVh76Md9qiOHHy4kdgz6+18j/dPEg8K8lpercJbrj6azIDGRpf6MWMdR2i5W
         2LRhu4pc4U0jlzeNmYPzD/mDAJhVCV8vAK7/R1x9QXspnSrKUXlzKQzXmIvb3utv0iLW
         jpQA==
X-Gm-Message-State: AFuF++m70aX9lEKsfe7BZ6BFzhvDWiUjaXEZb24F2L91Utq0qpz499YE
	v4q73qkftmrs8OIAYAZM5706b/afiNDqPrtowYY7Egm7sqso/O9lXQkEWcjhqwcm1lftzRpQz00
	Ju56Vptv+4+CdOG12oI1pZSA0ht7/bNBQzPcllpDQXhb6JLoOX8yCX5ry0lUUTonZnDPFe43BF9
	IKPBw=
X-Gm-Gg: AYBFou2rIu/l1Q/P2ZIoLMLMkX9EoUw86ohGx3Lb1izh6uZ8MCflfg/R4gx7cIGZUNO
	YA4LUMe1cUsh/EmN8Ax56gKl0TCzCe/huIq8xbIe1EgDmxrF85ajYv8RZ6cYEq9ZlH26QEIkGrE
	1a1Cf1ZMZ8UjkS2XDlgg4JKxug76/NgyeqFGYf1GeTZw6uw1m8Y6ErSP9NDzA3p3wK2GABerDew
	fwanDyfGfuBH9JzODbU/4U4VB9E8QTjdHMqcGNBAlmuBNQD2V/SIM+vJ36YWRI2nJgwStr8zTE2
	PL4GIWyNF7Gi+z2LLqvUxPihI+tJqOtDbimwMp2U0q0XZKifYr/6RNvSM1vvhaF4dDGlfg4waK4
	EwrIH1Hwj6z71vFoLQ+DjSsihoufF22Of/+1/
X-Received: by 2002:a17:902:e946:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2df69d222b2mr23014975ad.13.1790168692349;
        Wed, 23 Sep 2026 06:04:52 -0700 (PDT)
X-Received: by 2002:a17:902:e946:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2df69d222b2mr23014575ad.13.1790168691704;
        Wed, 23 Sep 2026 06:04:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dbc0fsm10216555ad.57.2026.09.23.06.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:04:51 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:34:46 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: hawi: Add base MTP board
Message-ID: <20260923130446.go47aiotedy5nprb@hu-mojha-hyd.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
 <20260922203905.6098B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922203905.6098B1F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3ce75 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-hpYfT6GizXsa3i9xE8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: e6wVvj3YDZCspjlIfVCEhPmMZ66Z2fKA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfXwWHKfhnSSxA9
 +5jXFUupR8iEaqhw7yHkbmCiZuEozZQSfuyz46VLXDCL+VDoSTwXhMwDKZw0lm+GTjcV7Tkjm0u
 fdTSUspHNtwlpReM+1miOOVpQ5VrIXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX0pjZ4UStfxPV
 f1Asn1BUDCNibDmh3xGbkQJTbizdwbvu2jHyMjN3V4EX8ay79t5mteCbgYQznrLHZ+9DpeDqpDB
 PmNkSSeISR7P7gZ+5Z5Ox1CJqmpEyh1qW6hTxS/3CGC29UcOOSFWhVH0m1emHtZfUMdB6LaQh4O
 KDD/SBKt17GMXH6eDLFtSFK3XxjbmGc5dnFz7HZD+MM+ya9bl5EDJ2KkzcosNTpZqwaZIzKUVSf
 rMvCcsAAsbznW+QZNBfyiXnVuZrgj83jtpLUBWEKrPWgmIcnG5o7GJFs2CdsqWly0rG5yyDnn6E
 xsffWIB+ryVylMs1H/DsvCs7D6lpQI/oUlisW3gelNXu1EGNXOfvk1+o2kvV2PcKeNK1lgbkzJO
 EGvTZwtmkhUgDWvy2swFPQ9KNQwGERc/HUoH1TrNFq7vBUfMsCUIb+G9E0gvAaRwEWXx7fmUJvx
 X+R6bwoDT2P3TmjUrzw==
X-Proofpoint-ORIG-GUID: e6wVvj3YDZCspjlIfVCEhPmMZ66Z2fKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On Tue, Sep 22, 2026 at 08:39:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] dt: empty endpoint with commented-out remote-endpoint in pmic_glink_dp_out
> - [Low] dt: use of deprecated 'gpio' property instead of 'gpios' in fixed regulator
> --
> 
> commit 4899e77f8239c42c43d695808f8c3db4831e0a93
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> arm64: dts: qcom: hawi: Add base MTP board
>     
> This commit adds initial support for the Qualcomm Hawi MTP board. It enables
> several base subsystems including PCIe, SD Card, UFS, USB, remoteproc, and
> the UART console.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> > new file mode 100644
> > index 0000000000000..7709582491f9d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> [ ... ]
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> [ ... ]
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_dp_out: endpoint {
> > +						//remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> > +					};
> > +				};
> 
> [Severity: Low]
> Is this empty endpoint intentional? The remote-endpoint property is commented
> out here in pmic_glink_dp_out, which leaves a dangling endpoint and might
> violate OF graph schema requirements.

I can remove it for now, once display gets enabled, it can be added back.

> 
> > +			};
> > +		};
> > +	};
> > +
> > +	sdcard_vdd_3p0: sdcard-vdd-3p0 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "sdc-vdd123";
> > +		regulator-min-microvolt = <3000000>;
> > +		regulator-max-microvolt = <3000000>;
> > +		regulator-enable-ramp-delay = <1500>;
> > +
> > +		gpio = <&pmh0104_c_e0_gpios 5 GPIO_ACTIVE_HIGH>;
> 
> [Severity: Low]
> Should this use the gpios property instead of gpio? The gpio property is
> deprecated for fixed regulators, and using it might trigger dtbs_check
> schema compliance warnings.

I think, this is fine., no change is needed here.

> 
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&sd_card_eldo_en>;
> > +		pinctrl-names = "default";
> > +
> > +		vin-supply = <&vreg_bob1>;
> > +	};
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com?part=4

-- 
-Mukesh Ojha
