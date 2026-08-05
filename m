Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFF73C7DE1
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926434; cv=none; b=bi3tyxj3g0M+q1jVKod8lSifxoOEqI9HZjOxTSl4DMVDKWd9sihT+GBMKoQgYiMc2jcQCcfTEdAsoK4fCFLyHrbJThRiZq4EXI8nwJS/eMXDELWCACvPblcYCk6llKp+MVAwUP3XLLhhtTkF3Lyvd/4E6CbXjjXCfjWC6IU4MPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926434; c=relaxed/simple;
	bh=EuH4gB5KVHtdBnhlffRdlkZPp7XoNHVpp59wWqPY3Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thkh3HyrFC1L/8aP+1Zlg63gFd10Tw/zv5JB86Tf4pkmwOybIH6oEj3SF8496cUMNrTVE5SrLAVGIMzdNWt86d65qx/nyIfym9u+fj6WrI7pVh+5rneTdxu1e0/f24Y84ZP0yxewyvoiYGzAnZS6QykRjeCmZg8q1mPCthiyYF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUtkKCeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juUs/wfh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUtkKCeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juUs/wfh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6759Dhw22442079
	for <sashiko-reviews@lists.linux.dev>; Wed, 5 Aug 2026 10:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZ156JEzOYk9UYAm2WJ15zweSCsPWiYgW6z2gME4cyM=; b=BUtkKCehzd8jeb1i
	6yrGpS5wWvhCmD34hPPT5TWgQrX20nu6Cs9uotmj2AARariFGALAgSDhMWKdVyx8
	Gt0xjhyhKVtwAohTJcUoSlQ45CuXF3ILMtgl4QoNXV/RwJd+lqopaHjk5NLwiRSM
	zrJQNfgaBzHciIiOBvEYK7upkUst+sFxvcbLO+T6Tz1P27dYFHXlWqiu5AYUSNwB
	Qw7cTAV126PP5zexW8Py9/ymXscjsSQAspBiyBaaQCysaCnDKxNfy+1HaLSBk5NW
	ML9EdOc5OfEbwamO5fFKlZHGtZNKbK2TkX3tDhQNMKxJqyzV2hFEsttVkppJAIxS
	Iji3PA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2c08by0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 10:40:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso660157a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 03:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785926431; x=1786531231; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZ156JEzOYk9UYAm2WJ15zweSCsPWiYgW6z2gME4cyM=;
        b=juUs/wfhWBDcKtNrKIHlm5pZeLVb6FSLPyDXkJsmBLs8aLeerMMwg1nSBAeclCDfpj
         IHXMz+Dp9z/SrdgtQo5Jfw6iH4hj13LPgnNfgEywUvj/PTSDO3Dmkwy2kT4xJUJp5qf/
         i+IIDr49AHk69RVunT/BPzhQ2oeV8CG+PQaBxi8MWmR+ObDwwe+bJ9PVM+56unBKPw7y
         OFk+N4LC3oQXKt60dsKCFv00px5Qv6CgdbMT3UJcDit9LUNZycuKYfW9iIfkYLDgZFDr
         AQqKATH0LYhziG7eWMOGvaxei6M4/KHcUhpumFEcSC14dqUEjlp+2MMRmk0gbS+7wfCj
         KGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926431; x=1786531231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZ156JEzOYk9UYAm2WJ15zweSCsPWiYgW6z2gME4cyM=;
        b=VZdy7IGrKNFEtCuRAgY2te+0ejXgU/2u6oC/jzhHve4yJDshU0XhesqYNt/5Axa0cH
         ZTvR/b9ALP2ux8cxD4u2Ugl5weY+h7QNCDENDX9NC4zEPtL0737OupsIKswHKzP8WvuD
         sk8b8Q5PZh6Xif6vITRI/wtaT4l7THUGvkwccPeglhZD4z/8GxZ3iA5p69UwOQkUwoGS
         OGMgZsgISJ257DvuV+vRSACZwOvbtGLaxV/spqdHCY5y1i0zCZvvKlQVQSCb7QqiLpYr
         6aKHLTdz0mRXZbyVOr5mARWfhJXluB3QTTbq20qXoplwJmoeoPStWrP76BrQWTHA/qp2
         hAgw==
X-Gm-Message-State: AOJu0Yz+Ya5XZVOnaaX3icZgANL9kS5Bl/94uAOr0vXiUtYHFFNy6zbs
	nmuLIzqisL8cyr3NJ8G7FE3iSAIIduagDIdwsyuedqVYBkljh02ldicdFcICk+7rIN74tTaMHY7
	NJ1flLv4eqVq1KMMOpakKMZ8puvsJ9i+wRvRJoOme+a3TijlE/4Cp09ZY0UHKGE7XO0w/qUz+Cc
	bPr4A=
X-Gm-Gg: AR+sD12wAFBZRgG7hfThX+aft4jWGXqtp+mV+dkZZkqVZgHC9D0z7akPZkULXGRaHsN
	ixyZm4pPVbLdmVQMiPTO3sVAKH9P2HIPOSzjRhX9RiR2a56GGRPUtQ7wi2ZayswCmf081FdWC5Z
	weUOinocodTVzplvI/CoIl2irPklCY3dSJamnjAx9qDi8ep+joyIc5juJMSAJ89tC/rkjhSgSVT
	/+huiSONm3vEzKYgOK8DJMacADhrKQePq51aLKg/OsXDQx2lC2hvGvLWuYQXNgZhlsO2Qx8fOae
	LDrXQmH70wsoEUFKdm+IntiqARZgYmNBIniMxNqnL5RhKIvetreBVjpuhRhnogLAgMqN5/tDIid
	7HkCn7KjCQ9rjxQWnbwacMEKLAeOl+ZDTxzrhpViaMLneYl/R2ATUp7aHXfo+0nTRd1GcWeJDvA
	ZBF7ybhqEShuyV
X-Received: by 2002:a17:90a:d443:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3903c594637mr6433947a91.10.1785926430517;
        Wed, 05 Aug 2026 03:40:30 -0700 (PDT)
X-Received: by 2002:a17:90a:d443:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3903c594637mr6433885a91.10.1785926429953;
        Wed, 05 Aug 2026 03:40:29 -0700 (PDT)
Received: from [10.79.116.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38feda512f3sm4328440a91.11.2026.08.05.03.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:40:29 -0700 (PDT)
Message-ID: <020e8c1d-c96c-4dcd-ad6c-1ec9d88a11b2@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:10:26 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <20260728180217.26B4B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728180217.26B4B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YDGKCkV7kEZ3Ba8eDjdqAwJ7XgMo3BiN
X-Authority-Analysis: v=2.4 cv=aOfAb79m c=1 sm=1 tr=0 ts=6a73131f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VOn4wSuHKkDc8vfdhpwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NCBTYWx0ZWRfX8kYSD+mPDf6X
 BGZ5uQSUPlv97P3mh35CxkC5oAkv4tJDpCz1OwcMnGJ/hth6D0c+aeNNnYeVTHfba6fAXOtf2Xs
 cfSA++4mAAdbcEaxanK8h/1ak6skFzk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NCBTYWx0ZWRfXxxTuAwUqB77Z
 Rv/a+ZbyFeRksTBLdLCj4gbMhEpKLto6p4C6t7rwIWRq8/+C8E86M4brBxts4++iUwvNQ+y4kan
 PdPL4ziYOTwjDr7lJPfPQomGnaOJePXlu8E2ECNGu3doYcWniqKpvXnfQqTeEKnaQiKlGonr+qC
 ls45s1XiIvGUrJUUyN7p7JcZCGtM66KqaxGWy4Cp8qcNYdpQkmYsiCzdkupjlI4Ce+qIQYDztyT
 79qoIY+mVA+nB7lytXW08DR5xds6iSUVeHnVXFBOP7eU6gwUqqHbbx9gv/2Lyawrteqwxf+SNvu
 YS6rsyg8tUOtuZpAWO31C14zwYn+1ioRrFZgSbaZKyblof1AiTqx4J4tS5huF1mC8i5/aG6NLlH
 umB0PTwpzVO8iMo4j0Et0Jnn38pM1cBBEi9jebwrJ3eLy8ZRaPGltIotQ1xd6Xi8h8zqXIo3JTR
 TcS8UMtooYFPY1XQc7Q==
X-Proofpoint-GUID: YDGKCkV7kEZ3Ba8eDjdqAwJ7XgMo3BiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050084



On 7/28/2026 11:32 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Race condition in probe leading to NULL pointer dereference in IRQ handler
> - [High] Incorrect error code on device_link_add failure causes permanent probe failure
> - [Medium] Missing `io_lock` acquisition in fan control functions breaks EC command serialization
> - [Medium] Thermal polling delayed work unconditionally requeues itself even if no thermal zones were found
> - [Medium] Suspend error path permanently disables thermal polling
> - [Medium] Integer overflow when accumulating args.args[0] into total leads to heap buffer overflow
> --
> 
> --- Patch [2]: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction temperature reporting ---
> commit d5d00275c6c452ac414dd45c11ca38e64c17b24a
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> platform: arm64: qcom-hamoa-ec: Add SoC junction temperature reporting
>     
> Add the EC command definitions and handler function for reporting the
> SoC junction temperature (Tj) to the EC.
> 
> [ ... ]
> 
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 5ca7308c60774..4c745b78322c4 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> 
> [ ... ]
> 
>> @@ -77,10 +89,14 @@ struct qcom_ec_cooling_dev {
>>  };
>>  
>>  struct qcom_ec {
>> +	struct i2c_client *client;
>>  	struct qcom_ec_cooling_dev *ec_cdev;
>> +	struct thermal_zone_device **soc_tj_zones;
>> +	struct delayed_work soc_tj_work;
>> +	struct mutex io_lock; /* serializes EC command sequences */
> 
> [Severity: Medium]
> Does this mutex also need to be acquired in existing fan control functions
> like qcom_ec_set_fan_profile()?
> 
> Because the thermal framework can invoke fan control at any time, these
> commands might interleave with the new background thermal polling delayed
> work, which could violate the intended EC firmware serialization.
>

Yeah, both callers already hold io_lock around that call, same as
everywhere else in the driver.

>>  	struct qcom_ec_thermal_cap thermal_cap;
>>  	struct qcom_ec_version version;
>> -	struct i2c_client *client;
>> +	int num_soc_tj_zones;
>>  };
> 
> [ ... ]
> 
>> +static int qcom_ec_setup_soc_tj_zones(struct qcom_ec *ec)
>> +{
>> +	struct device *dev = &ec->client->dev;
>> +	struct device_node *np = dev->of_node;
>> +	int nproviders, total, i;
>> +
>> +	nproviders = of_property_count_elems_of_size(np, "qcom,tsens",
>> +						     2 * sizeof(u32));
>> +	if (nproviders <= 0)
>> +		return 0;
>> +
>> +	total = 0;
>> +	for (i = 0; i < nproviders; i++) {
>> +		struct of_phandle_args args;
>> +
>> +		if (of_parse_phandle_with_fixed_args(np, "qcom,tsens", 1, i, &args))
>> +			return -EINVAL;
>> +
>> +		of_node_put(args.np);
>> +		total += args.args[0];
> 
> [Severity: Medium]
> Is it possible for the total accumulation to overflow if the device tree
> provides large values for the qcom,tsens property?
> 
> If the sum surpasses the maximum integer value, devm_kcalloc() would allocate
> an undersized array, and the subsequent loop could cause a heap buffer
> overflow when writing to ec->soc_tj_zones.
>

I'm dropping qcom,tsens in favor of thermal-sensors, so this
accumulation code goes away entirely.

>> +	}
>> +
>> +	ec->soc_tj_zones = devm_kcalloc(dev, total, sizeof(*ec->soc_tj_zones),
>> +					GFP_KERNEL);
>> +	if (!ec->soc_tj_zones)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < nproviders; i++) {
>> +		struct of_phandle_args args;
>> +		struct platform_device *sensor_pdev;
>> +		u32 id;
>> +
>> +		if (of_parse_phandle_with_fixed_args(np, "qcom,tsens", 1, i, &args))
>> +			return -EINVAL;
>> +
>> +		sensor_pdev = of_find_device_by_node(args.np);
>> +		if (!sensor_pdev) {
>> +			of_node_put(args.np);
>> +			return -EPROBE_DEFER;
>> +		}
>> +
>> +		/* Ensure we unbind before the sensor frees its zones */
>> +		if (!device_link_add(dev, &sensor_pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
>> +			dev_err(dev, "Failed to link to sensor %pOF\n", args.np);
>> +			put_device(&sensor_pdev->dev);
>> +			of_node_put(args.np);
>> +			return -ENODEV;
> 
> [Severity: High]
> Should this return -EPROBE_DEFER instead of -ENODEV?
> 
> If the EC driver is probing and the sensor is not yet bound to a driver,
> device_link_add() refuses to create a managed link and returns NULL.
> Returning -ENODEV causes the probe to fail permanently, whereas returning
> -EPROBE_DEFER would allow it to try again once the sensor driver binds.
>

No, we already defer earlier if the sensor pdev isn't registered yet, so
that's not why this would fail. The only other case is a dependency
cycle, which won't fix itself on retry, so -ENODEV is right here.

>> +		}
>> +		put_device(&sensor_pdev->dev);
> 
> [ ... ]
> 
>> +static void qcom_ec_soc_tj_work_fn(struct work_struct *work)
>> +{
>> +	struct qcom_ec *ec = container_of(work, struct qcom_ec, soc_tj_work.work);
>> +
>> +	qcom_ec_send_soc_tj_temp(ec);
>> +
>> +	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
> 
> [Severity: Medium]
> Should the work item only be requeued if thermal zones were actually found?
> 
> If ec->num_soc_tj_zones is 0, qcom_ec_send_soc_tj_temp() evaluates valid as 0
> and does nothing, and then the work unconditionally requeues itself every
> 125ms, creating a permanent timer tick on systems without these sensors.
>

I'll fix this in the next series, bail out early if num_soc_tj_zones is
0 instead of requeuing unconditionally.

>> +}
>> +
>>  static int qcom_ec_resume(struct device *dev)
> 
> [ ... ]
> 
>>  static int qcom_ec_suspend(struct device *dev)
>>  {
>>  	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	int ret;
>>  
>> -	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> -					 EC_MODERN_STANDBY_ENTER);
>> +	disable_delayed_work_sync(&ec->soc_tj_work);
>> +
>> +	mutex_lock(&ec->io_lock);
>> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					EC_MODERN_STANDBY_ENTER);
>> +	mutex_unlock(&ec->io_lock);
>> +
>> +	return ret;
> 
> [Severity: Medium]
> If the I2C write for the modern standby command fails, does the error path
> leave the thermal polling permanently disabled?
> 
> The PM core aborts the system suspend on error but does not call the resume
> callback for the device that failed suspend, so enable_delayed_work() won't
> be called. Should the error path re-enable the delayed work before returning?
>

I'll fix that, re-enable and requeue soc_tj_work on the error path
before returning so polling doesn't stay stuck off.

>>  }
>>  
>>  static int qcom_ec_probe(struct i2c_client *client)
> 
> [ ... ]
> 
>> @@ -370,10 +587,24 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  	if (ret < 0)
>>  		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
>>  
>> +	ret = devm_add_action_or_reset(dev, qcom_ec_sci_evt_disable, dev);
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret = qcom_ec_thermal_capabilities(dev);
>>  	if (ret < 0)
>>  		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>>  
>> +	ret = qcom_ec_setup_soc_tj_zones(ec);
> 
> [Severity: High]
> Can an SCI event trigger the IRQ handler before the probe finishes, causing
> a NULL pointer dereference?
> 
> The IRQ is requested and SCI events are enabled on the EC prior to calling
> qcom_ec_setup_soc_tj_zones(), which allocates ec->ec_cdev further down in
> the probe function.
> 
> If an event fires in this widened window, or if the setup fails and returns
> an error, qcom_ec_irq() can execute before devres disables the IRQ. The
> handler checks if the fan_id is less than ec->thermal_cap.fan_cnt, which
> would be true, and then dereferences the unallocated ec_cdev array.
>

I'll move the IRQ request and SCI-event enable to after the fan cooling
devices and ec_cdev array are set up, so the handler can't fire before
ec_cdev is allocated.

>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to setup SoC Tj thermal zones\n");
>> +
>> +	ret = devm_delayed_work_autocancel(dev, &ec->soc_tj_work, qcom_ec_soc_tj_work_fn);
>> +	if (ret)
>> +		return ret;
>> +
>> +	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
> 
> [Severity: Medium]
> Could we avoid queueing the work initially if ec->num_soc_tj_zones is 0?
> 
> Similar to the requeue path, this starts a background polling process even
> if no thermal zones were found during setup.
>

I'll make sure that only queues when num_soc_tj_zones is non-zero.

>> +
>>  	if (ec->thermal_cap.fan_cnt == 0) {
>>  		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>>  		return 0;
> 

-- 
Best Regards,
Anvesh

