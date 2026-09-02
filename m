Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD40374A05
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337551; cv=none; b=ByIjDMFp+9RXaCYwyf4+LQr6LNhXJUKLRc+efjv3ypHdDibrG8vAiTY+K3XD9dCFrzrXSYFK6hkcwO86R9Jgmr3e8Ir3veHiclpB65GOnbixrDVxhhAzfyA86urF6ekk7ofWl0jJSAgu3dsmDx+xRSO/NRVtU9dLILLqHqgfLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337551; c=relaxed/simple;
	bh=eDW1PymceQ69R/4nuaQ5nGV5Pv7cV4+Zg5HO2YE5KUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhaVV/cat5DJ20Azy0mwqfE56gNNl1ZuHtWMkx5lTAdll8XJqUFKRETfc3STnPmHDL/cRlUnNqnFdDlfGnIuaVFiOAOM87mrzCaS0fg07obgJfw6aMfiLiY1HT4BxBIVSoiImySPTO6irtiGPNMN3D8IS9dzu+a9y1QQ+cK4CSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cw44aqmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4G+apNK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cw44aqmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4G+apNK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VWWa758552
	for <sashiko-reviews@lists.linux.dev>; Wed, 2 Sep 2026 08:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U8LjS1f4f0oRNvBA4fn3Gpkk
	oMiN8jts80hvI4ULse0=; b=Cw44aqmRos8OLLOTuEsBzUnZ1xWUYv90P/C55Fqs
	auonVFLTjZI8hlhW4sX5cYu1Zwzr69hbnTw4kHz8LBDp4Fp3/NYP9uAx3RXZmtct
	Xk8M7/iEfkD+b032hSB1RnkNdTRWQj8URLRWZABDoHFgXYGoyNRjLluWt9d8g5Fj
	2LJl0FTatCy9JqEKksi3wkbNngdfnnSMzAgq2rcee6MOEEhT+vNdvt/cY6rgAIVP
	m6m2IzlnNzzy/foKx9QaK7BhSCc1bB102JEs+abdR/WgH31L5AO7k8mgN/j4HpE6
	G464fPLSGZbU/lOTXMdrJlpgSfLdYgKvhWMOFr0W84IFmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j2wv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 08:25:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso104688485a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788337548; x=1788942348; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8LjS1f4f0oRNvBA4fn3GpkkoMiN8jts80hvI4ULse0=;
        b=j4G+apNKPly9qU5w9kO0VArkYwk+HfPoy2PDHw6BvsxO43+JF2NhDVEKF8eC/K4DrY
         aUfkYmx+Il+RAH+EaQys8n3cD8VSFcJ8O0WcHxHXS31/BqmFXXJP9zoBjDjHw1sX1xft
         OkjDefDilxKZ7UkgkboF/85zwpmYgJ2Z4fZIdalFFNlx4WqvpcoNePAoA24ObycNMXgL
         2Q5F4PCrohtJZaWespj9vRwQxkIdijN2gd1+LRp9Kz+7Rdb/ZlLi0W8Mu/Fa6u+7jrkd
         v5GtlAxs8rjvhUgL395d558AkcnjahSWQ6eBW854HUhMWpxfAXwLsgxBvNdq7AoJgvJ/
         0LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337548; x=1788942348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8LjS1f4f0oRNvBA4fn3GpkkoMiN8jts80hvI4ULse0=;
        b=UQhZdwGMBZRjdXiYgsOijEFaR9kOCcv8NcBgaeXCHg6KJ7gS+izNxEi2fcbzEHZ7rd
         WrlvjlNnUP6jIsBGChfUds2epk+gkaHBnVike2QpoOSriYmDmCUNyhkyiXqNbMLO3sRX
         fOesU4rbE9A24T8y8/36+XxNSGB1TVV3e5Y/7YPE0yIT2l/AMPvfO7zMndPdN0Ec4Tbi
         eRoOV5Fuifs7wk8iaqW2qERKL/S6AjveKln24z2/F4UkwZHRAUQ3edhi+iayJWWxe1QY
         vIUK7po9yIfB6/J0axUGUNW0OjqI9jCWlRIFmfc7vit8ytA4Lfn42d3KIyvtbFIClGwR
         9yXw==
X-Gm-Message-State: AFuF++nJRyafrakY6Dr7uRq0E4K0s06pjvf8JF/B5sR7Qc3qey78jPj1
	GoLKuHHg7LuVSGhbeYqwY0iOQpjaTlqGJldx5s/5uSiJeH1ARcZ8PGOoZhLp2n/nxqhGPfa85w7
	f5e6jUDvTHELyMvlT8lJrxnsYFUSeZu5Mg8Oy7G/2o+RPkFLnYt8fZxRB+fI5rP8ywDU6Kgwxnz
	zrO8c=
X-Gm-Gg: AR+sD11rtkHuZayDaMhYU/4EfJCMy4NcHudZE9LKf7UUySPvFkRAen691dPmh6xU3Un
	gi6qT4/LMHYY0U37GplH/k7KdNXrqt0IkMIO7in5q1dK8aoJjNFqUOQSSWv9SWL7URP6WCkgX5n
	DDcp1gu9bvxyD3oOLAyJETDstdK1UnIhaTawNMIEsxf66Gj39xMBJfaIQBoB441v3USFwDHwmgW
	1jCZ4sI6eyVOuC4bZTSzNvvf7EyznTjy2p8XnIqiVcJWSnHmJeT5g0SK9/6ysdWHzPuvqKXSLwo
	NzgQ5cdDbfJq8tZSyz725f10fSa/Je2L81wXkw08fOyHBOBG7Nb1FUlr1tBtVfVGqCSe7j/mhbl
	g7EvpVB5X9vp9UKQ=
X-Received: by 2002:a05:620a:6a87:b0:92e:6637:da3 with SMTP id af79cd13be357-93960fd096cmr348228685a.38.1788337548352;
        Wed, 02 Sep 2026 01:25:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6a87:b0:92e:6637:da3 with SMTP id af79cd13be357-93960fd096cmr348223885a.38.1788337547749;
        Wed, 02 Sep 2026 01:25:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4459993f8f.36.2026.09.02.01.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:25:46 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:25:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722
 GPU
Message-ID: <q4u2bxbguq6klsutuypulazvyod6n5ifm5n3pfdqvuumgdcbsc@bhuyaqeoh565>
References: <20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com>
 <20260902081850.C15861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902081850.C15861F000E9@smtp.kernel.org>
X-Proofpoint-GUID: V7WkcINXF4IzNCZs645uunAVCEErva2U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfXyYCX/2hXbwot
 0yvI8CfXIUPSA08ensveTVTnehQTf0i7Od/28s5H2frtlWtRP9a4rT+eJMmyRICj3/5qKJtyuAb
 sZHL8qXBlk1aFN88ACbYa8+WY+5skRg=
X-Proofpoint-ORIG-GUID: V7WkcINXF4IzNCZs645uunAVCEErva2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX98Gcx6C5ESp0
 AzA/Rl05Zi/4rVXC9l8suEGATtRinuL0R0WE9nC1w2JvTurfSPSmXnsnGCkdDRWG5fqjKn57BQ/
 WzBm1ou0OWjA5s6O/6ofA+/6yABWDhLGc4G/rpENHTsOF9eTmsXWbNuYhNZG1YpZ3zlu1WAGNAT
 yGWWSvnXnP1RoSpuZJQt65Kcy2OAxve2aaiVWUo/NeJvzYJqXMkuScfrp5f5dVYqBOFIJ2UJPTZ
 t8JFap/OiJQXYNW9GPZB7T9jWaSd5fk6GEFXQgonDTEKfZxVRcgu6ll5368T32oSmE0h3KdIULj
 qd16vwQ2NvBPOL7dmfD7gMCtCP9YdVNccsjAzpmZMjvDYh6otVGpjNE6LqjfL5WMaqJ9gYFHpey
 7f+bYPc08UybppJTE9jrY/Gl7iqPiedhUMI4NcvqTg0vcK1cQrzsVURhS2mVZOMOxExWGhUJjKQ
 lpmsVp9blThzmdqPQZA==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a97dd8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4NdBFP2jvZ9CJdPtIxQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020073

On 26-09-02 08:18:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The overridden DT nodes are not sorted alphabetically by label.
> --
> 
> commit 69d2b599210486d1fb104df39a0da4a840c7aa02
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
> 
> Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
> shader firmware path.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> > index 5ef6c51618bf9..918f5289ca45f 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> > @@ -374,6 +374,14 @@ &pm7550ba_eusb2_repeater {
> >  	vdd3-supply = <&vreg_l17b>;
> >  };
> >  
> > +&gpu {
> 
> [Severity: Low]
> This isn't a bug, but should the overridden DT nodes at the root level be
> sorted alphabetically by their label to maintain consistency?
> 
> Since 'g' comes before 'p', the &gpu and &gpu_zap_shader nodes inserted here
> in arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi should probably be placed
> before &pm7550ba_eusb2_repeater.

Urgh, good catch.

Will send v3 with gpu nodes moved in proper place.
