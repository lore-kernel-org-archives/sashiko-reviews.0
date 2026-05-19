Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F106D3A7857;
	Tue, 19 May 2026 06:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173736; cv=none; b=fNzy7cOXy542gOeGaZ5oOdemi/KuFhLTaFcnIO7xijnydHKt5B5uuY6n/+3NpYfRmRj/SfMlncOXcJbThJSlTqClcWhmo6j59ZxxUTGlFYG94elB8Rhm9c0U//6BNU28vDN7AjhO5sAyx3Tgut0pKHBlJ55q6savIFxc3qXfsKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173736; c=relaxed/simple;
	bh=fgNzbDBuscOMK5K2benapcqpzqN2CvS+MjI3jhWGbW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TY04TY+PTVyXMGH9C0y/JJR28V68G6yMlqEOVuOmUSKNMHkWWCl2g2gwxDiDzWu4GhkecO4pi64n/7XXqjfm036GczKn2ZLbrjJSyVXq0GergtdsID+EHz4/fxcm/6OnXfVyjpwJ9J0G9lgMNStUOCd1h1MAtmooaPs5psyb+x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPC1HT7+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPC1HT7+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1WIJl2975542;
	Tue, 19 May 2026 06:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fp0TdVJpJDa0rgixp8cNzMgcylXEBSFwBIwfBxAfqBQ=; b=RPC1HT7+az8LAQ0/
	sYTjEjE8KPDgYpr2hMOcb38Jsz5cqp2w+6XmGI4m/M0LiLahN6ISOyrJoBMswTjO
	ZRZSlKUB8FStuoSSsgnxhJN8gAxVlXgbhfgq34Oga0l1NPw/02D3Q9cP7cu+kMg/
	b3qP/2LPMKDe58lETstzq+De0nRrCMYGCaj9gsYoukNMsdNaUS2TdiCuJOybrBe+
	VGd7mqX7QX9hi8ws8IdOFwX/nwmlieNTipfcR/mn3gOBtzkKGiFi04BrnDH1ln31
	Au1AwN9VLP+tNjrgq4rCpJpsrXUACG8xbnMNXXUCFDA73NTIUZihsBUYOBVHFZHv
	41jutA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4b2hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:55:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64J6tD0u020667;
	Tue, 19 May 2026 06:55:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e712fh6g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:55:13 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64J6tDa9020649;
	Tue, 19 May 2026 06:55:13 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64J6tDrb020645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:55:13 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id A51F3B04; Tue, 19 May 2026 12:25:12 +0530 (+0530)
Date: Tue, 19 May 2026 12:25:12 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        konradybcio@kernel.org
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: Add support batteryless
 boards as MAINS
Message-ID: <20260519065512.uobvdvsdx2ggoyyj@hu-kotarake-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-2-31fbaa329879@oss.qualcomm.com>
 <20260518151013.0F8E6C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518151013.0F8E6C2BCB8@smtp.kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c0963 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=uR8Etrdt1h4LkKDUJSYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: LTL10dxMd45dLsJ14pVLodOluXnWYw34
X-Proofpoint-GUID: LTL10dxMd45dLsJ14pVLodOluXnWYw34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2NiBTYWx0ZWRfX3hHTw0hVbLW2
 dYhP/G1ImcRcy15mOrIJ19jN1+7Ogbie0ZrGuH+j0BfeU9ZW7z+cUbGcudrwumzcCMzsWr/meNa
 808dghmXm8XQMU29Ukz2GykJRC3pZ4NMAkGxbfsXixGKlh587E1v1Lq6wGNPSQLLtHcHmwTN0Fp
 xfkcqb0A6LxjI6YPcV2C93alfTwWxgRzpCD9ZqzBIPrZ7PUc+rml17jYUbDuqsjjnK/qTpOW5Q+
 I18aZWHqn+Tz9+W1H9qnqZs4LSak73vLfGZbS9YfivCmq26jhRMSQfd9HOngDz1hket7uH2R4Xe
 c5jMT2+Dz/5dhw2OYwijkQRxow3gJYRy5U466D++fZ0fr2RJ1WNvGxALr5QEan9sBogaasLtEBW
 AvuSsdq6+3VN2DNJzC0kD7x5nOfXjSR8iUFqiSmw/By6oveSlh6XXFinKEbtJcHn6HbNDOklulp
 eWQ91I64T3nmdDRtoww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190066

On Mon, May 18, 2026 at 03:10:12PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The new MAINS power supply exposes BATTERY properties (STATUS, PRESENT) instead of ONLINE, breaking userspace expectations.
> - [Medium] The `qcom,batteryless` property is silently ignored on `SC8280XP` and `X1E80100` variants.
> --
> 
> commit fd3fd36bafd15a4f0b8a90d2f6b2f13ff0fc3a3d
> Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> 
> power: supply: qcom_battmgr: Add support batteryless boards as MAINS
> 
> This commit adds support for the qcom,batteryless device tree property to
> register the power supply as a MAINS type instead of a BATTERY. This is
> intended to prevent userspace from triggering battery power-saving sequences
> on boards powered directly by adapters.
> 
> > diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> > index 490137a23d00e..35d266375d8c4 100644
> > --- a/drivers/power/supply/qcom_battmgr.c
> > +++ b/drivers/power/supply/qcom_battmgr.c
> [ ... ]
> > @@ -930,6 +931,47 @@ static const struct power_supply_desc sm8550_bat_psy_desc = {
> >  	.property_is_writeable = qcom_battmgr_bat_is_writeable,
> >  };
> >  
> > +static int qcom_battmgr_dcin_get_property(struct power_supply *psy,
> > +					  enum power_supply_property psp,
> > +					  union power_supply_propval *val)
> > +{
> > +	struct qcom_battmgr *battmgr = power_supply_get_drvdata(psy);
> > +	int ret;
> > +
> > +	if (!battmgr->service_up)
> > +		return -EAGAIN;
> > +
> > +	ret = qcom_battmgr_bat_sm8350_update(battmgr, psp);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	switch (psp) {
> > +	case POWER_SUPPLY_PROP_STATUS:
> > +		val->intval = battmgr->status.status;
> > +		break;
> > +	case POWER_SUPPLY_PROP_PRESENT:
> > +		val->intval = battmgr->info.present;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const enum power_supply_property dcin_props[] = {
> > +	POWER_SUPPLY_PROP_STATUS,
> > +	POWER_SUPPLY_PROP_PRESENT,
> > +};
> > +
> > +static const struct power_supply_desc dcin_psy_desc = {
> > +	.name = "qcom-battmgr-dcin",
> > +	.type = POWER_SUPPLY_TYPE_MAINS,
> > +	.properties = dcin_props,
> > +	.num_properties = ARRAY_SIZE(dcin_props),
> > +	.get_property = qcom_battmgr_dcin_get_property,
> > +};
> 
> Since dcin_psy_desc is registered as POWER_SUPPLY_TYPE_MAINS, should it
> expose POWER_SUPPLY_PROP_ONLINE instead of POWER_SUPPLY_PROP_STATUS and
> POWER_SUPPLY_PROP_PRESENT?
> 
> Userspace power managers typically expect MAINS power supplies to report their
> active state via the ONLINE property.
> 
> If the firmware returns PRESENT=0 on a batteryless board, won't userspace
> fail to recognize the AC adapter as an active power source and still trigger
> power-saving or shutdown sequences?
>
You are right. For POWER_SUPPLY_TYPE_MAINS, userspace expects ONLINE
to indicate the active state of the supply, not STATUS or PRESENT which
are battery-centric properties.

I will fixs this in the next version.

static enum power_supply_property dcin_props[] = {
	POWER_SUPPLY_PROP_ONLINE,
};

static int qcom_battmgr_dcin_get_property(struct power_supply *psy,
					  enum power_supply_property
					  psp,
					  union power_supply_propval *val)
{
	switch (psp) {
	case POWER_SUPPLY_PROP_ONLINE:
		val->intval = 1;
		break;
	default:
		return -EINVAL;
	}
return 0;
}

> [ ... ]
> > @@ -1690,7 +1733,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
> >  			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
> >  					     "failed to register wireless charing power supply\n");
> >  	} else {
> > -		if (battmgr->variant == QCOM_BATTMGR_SM8550)
> > +		if (battmgr->batteryless)
> > +			psy_desc = &dcin_psy_desc;
> > +		else if (battmgr->variant == QCOM_BATTMGR_SM8550)
> >  			psy_desc = &sm8550_bat_psy_desc;
> >  		else
> >  			psy_desc = &sm8350_bat_psy_desc;
> 
> Does this bypass the qcom,batteryless property on SC8280XP and X1E80100
> variants?
> 
> Looking at qcom_battmgr_probe(), the check for battmgr->batteryless is only
> placed inside the else block which executes for SM8350 and SM8550:
> 
> drivers/power/supply/qcom_battmgr.c:qcom_battmgr_probe() {
> ...
> 	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
> 	    battmgr->variant == QCOM_BATTMGR_X1E80100) {
> 		if (battmgr->variant == QCOM_BATTMGR_X1E80100)
> 			psy_desc = &x1e80100_bat_psy_desc;
> 		else
> 			psy_desc = &sc8280xp_bat_psy_desc;
> 
> 		battmgr->bat_psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
> ...
> 	} else {
> 		if (battmgr->batteryless)
> 			psy_desc = &dcin_psy_desc;
> ...
> }
> 
> If a board uses the SC8280XP or X1E80100 variant, won't it bypass this check
> and unconditionally register the standard battery power supply?
> 
Currently, batteryless support is only implemented for the qcs6490-rb3gen2(Kodiak)
board. SC8280XP and X1E80100 variants do not have batteryless hardware
at this time, so there is no immediate concern.

We can revisit and extend this support when batteryless hardware becomes
available for those variants. That said, if you feel it's cleaner to
generalize the check now to avoid future leakage, happy to extend it —
please let us know your preference.

regards
Rakesh Kota
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com?part=2
