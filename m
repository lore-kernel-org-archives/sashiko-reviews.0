Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7123148D8
	for <sashiko-reviews@lists.linux.dev>; Sat, 17 Oct 2026 02:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792203919; cv=none; b=qVjrURTT+bsceCI3NoYWF6q8e9NESKa1T2L9TEwMe0t611m2m5YmItR43yaDkxJveCx6eufThkX3DO3WiyYg+unUeuXGMYMpZBnUiu+k6wDKppuvJ1kyw1nZR5Wedf84AM5wnfSSiFJ0wDTGEfmzgCKX/S4ezKoXw1sMoOGg2Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792203919; c=relaxed/simple;
	bh=7kSzh+8hr1/vGsRTQZvZjmH98OgqliB57+aAdVneaa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqHDs6HnDMjjMOQcxTxd9iv7bxgLtIfJEGHokCCFhXQbvnNuimR3FN3s6caLApjg6px9seBb1Ceu2O8EupCZkyF8BWy6TGJA+gS946e7S3rN4JnI++O+EykkAqbtdE0oTCkG5uWaSNIxDN/pyc0Go4Acas+iUXzzwkcvVsrFqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGtUJbBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejYx1V/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGtUJbBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejYx1V/y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNF7AO3663502
	for <sashiko-reviews@lists.linux.dev>; Sat, 17 Oct 2026 02:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3E4NAFlkvp1zNwET4nmHjYkv
	HWYSnKGWPbvmD5NwYkQ=; b=bGtUJbBLYp7k63KFx36defWtQTAWnwEhvoBJHafv
	aqqAxCUJxZf1/gukLfXIdR47ImH5xhPHtkJXIbWI2St7Z6tusKKEVcEtjcHs+7D9
	mIKonZcJ0CkerJhSZ1Htqk/kQQk2In5L26ymmd8XfcbYtrpJCWWykK9WfVFgug78
	DTxfyBXBexiJ/y61KCH+uVrnF5nGfqeiOmRAIMkYkRfKxExRqm8Y3xmlWmcC8NFC
	PY9nIxzl4/O/ibcJ2trYiP/qy//xlokedDH7hIJBK/dWn6yckRTIr48oIDSZrHm5
	6K1ZUqAlcDEJdyYA3Quig66x0us2TEwLat8FTA8pCksZvg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrwmsaws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 17 Oct 2026 02:25:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso828374eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 19:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792203916; x=1792808716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3E4NAFlkvp1zNwET4nmHjYkvHWYSnKGWPbvmD5NwYkQ=;
        b=ejYx1V/y8UHZ6trZhzcvU9TzLGRyDdDG7hLOdMj/A21NDuaOnkjDrWhKo38uj+90rx
         4SsJb/F5vp5vfaH5ofIHvZ04w6Iq31wzo9R78rxGod5F2Zt/L2JPLSyyWlmtXx65Ro6Z
         r9HxLzghpo9nXbYkpns95LJhH59L3C0gHK6o3WUgeD/rCDjQR95z8FOkryYkgmBNF9hs
         8lkQnftqg6xYjOLZoWAwCcrZavSHBP6eS9tR812tSi2KKrVcjPrp8RB8DYepi2XI2/+T
         OQ4Xcm1aYVhTi5lNWDXODBYvJTRmP3OGiujroaWpgS+en+2QwWlPJsPWGRcZXqmUJQ7n
         bO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792203916; x=1792808716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E4NAFlkvp1zNwET4nmHjYkvHWYSnKGWPbvmD5NwYkQ=;
        b=LGo7obNU2As/XhJTepZmIoV2MVTzukZwcUsmod6kbfr1I6PwQbC6d715PrdccsqjX3
         X2cywk+yZqs2P3ICDtOE3CZQv/DYzOrrz1V0uRUdSP+qHJg3frdlukodmYn32I0wSQYp
         heisUrwOJk4gVdqRncjDVezGl/enR/Ztf/IRbPpgD+QbVWafv6lAa2GhFzdumkZNVJ0S
         o37wNB3ceRXxeCz+5S7vzC4yLiDwqHlYgeFqu5uGeo0wNRnWUDyQE+C2z/j9VxxUnTw2
         8T68f7Nt29nqM4pbko6CB9FPXZ8BOL6A+IpzjSdrNnZ0EzINTVrV1PvXZVGWtTqHb97Q
         63DA==
X-Gm-Message-State: AFq9FYIrLm2Dbk2PoeikB6co0poEg8/FY5uUasyRqew31WMsMOZWsS3X
	CcxEo4PKeDLYSEzJlXVqzrCfoBHZjztqaJhJgCoWLCz7N5CCxpHCIBInyQ5NJK0WYNHdeb8rmGg
	kRA34aWOIqiK5ztoh4K/SAugxvI7IHi6d7hNThEOjRBYlw6A7VBX//ZNk7ew4jTcmDAl/AOcwAo
	TEeY8oDoA7
X-Gm-Gg: AYBFou0GnjcrLSEFFOz4QfHphtEg6/IMh/d/YRilVkwD6gmafmn+lWlz0fXX5LUWo4J
	fT99SPQdVoVx9cKkXDDigz31T/caNWII0g6imuUGqfBgitZyXOaOVrBCG/eSHoa5Vm7f5M8xVhW
	SeHK8hWiaN7vACptiaGzyAyPmA+IL+DhheVB/EubeeM/lzEcgLfv0ctZqqtzkCGRIKSGoCYWn1x
	Ym5BBMdY0WxtyHbaKBEemJqXkNGY+J0SVDXe01nEa2+mJPa/N9pTMX4H6/GZn8sg3ufVRMCbG1y
	H75dm5wtGR8yPSLqzsfRot6eZ481iHcNjnOhGHIdd4mIMVs3xAwy4ptq0cp8h7ncD8pz/4WOKVM
	XyccLoW4IGzgcijWZ2FOQiwKKNDoiBixV2tDTnW9mNQ==
X-Received: by 2002:a05:693c:39c4:b0:35e:cfe7:4c5e with SMTP id 5a478bee46e88-361a284a463mr2009876eec.41.1792203916326;
        Fri, 16 Oct 2026 19:25:16 -0700 (PDT)
X-Received: by 2002:a05:693c:39c4:b0:35e:cfe7:4c5e with SMTP id 5a478bee46e88-361a284a463mr2009840eec.41.1792203915557;
        Fri, 16 Oct 2026 19:25:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm16620016eec.12.2026.10.16.19.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:25:15 -0700 (PDT)
Date: Sat, 17 Oct 2026 10:25:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: Fix race between concurrent
 first users
Message-ID: <atLch7_22hRVUd7C@QCOM-aGQu4IUr3Y>
References: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
 <20261016144919.1362846-2-shengchao.guo@oss.qualcomm.com>
 <sashiko-outbox-174507@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-174507@kernel.org>
X-Authority-Analysis: v=2.4 cv=B4osQ+tM c=1 sm=1 tr=0 ts=6ad2dc8d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_qsbYfLqpLheL_tQKl0A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfXyXfxwPCwK0JS
 Fyw5QsliLnpTN/R5ZzyJ0ZdV46W65L8UCbjh5FFf5I/737MMym8LxsSCGQqtE48P6aEwM6SZ5yt
 RoHyEAuaRrwO2O5nD4Z63z2+PiCvhrpN+gaYpizQ3HGJWn5ZTddoKerZK97A90F2r2asvFafj9V
 QsPXgUEiUgEMchfXd8owLL9idUczKJc8PSvzBgdsCjzhHx3mkNUEf6wXJE326Ad9nVGdJ5lOMCw
 yevnLfnAHyN8r4t+X4KFcfLuqjKTFfwk4S3mWW6z2mS9wZWZNsv1X/ZdxMrjhtOr0OJm/7Y1fxl
 8mhxx0rKmT8JhMr4mJlSfnXiYnO7EKSVEZGwm6ibJFpdBdyZnmqiWFUhLp13Bmc/cxl33C/VL/B
 i1KHFzbgsbznaHp2m7LU3ZvEg33mGt1TuhChcMLjraerSdIrXTl5v6a1mSzsE/PVVYUMUCrZoIW
 UpKkzx7HuPQcDK1hq0Q==
X-Proofpoint-ORIG-GUID: _RK0olE8W_8JYmd4AzCqRz-e8aLlaPGt
X-Proofpoint-GUID: _RK0olE8W_8JYmd4AzCqRz-e8aLlaPGt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfX1VPA0qZGrel1
 7g/cx82tBQiwHMBHSLUs2Tb2DjjahpQOFXYgz8ytzarw47bwQcCxhbQmZnzXod125lT7M4m/yTc
 KERlU2CkklO24qLoicvpMckg7QqE/Tk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170009

On Fri, Oct 16, 2026 at 02:58:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] gpio: shared: set_value(0) is a no-op on ASIS lines driven HIGH
> --
> 
> commit b2e913f9e7adbb02eb24728f50149f4b95e20857
> Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> gpio: shared-proxy: Fix race between concurrent first users
> 
> This commit fixes a race condition where multiple consumers probing concurrently
> can both request a shared GPIO before either configures it, causing both to fail.
> It tracks the number of proxies that have actually configured the line, allowing
> initialization only when no other proxy has done so.
> 
> > diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> > index bc69b8729d196..0d1d724a6a376 100644
> > --- a/drivers/gpio/gpio-shared-proxy.c
> > +++ b/drivers/gpio/gpio-shared-proxy.c
> 
> [ ... ]
> 
> > @@ -230,10 +275,21 @@ static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
> >  					  unsigned int offset, int value)
> >  {
> >  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
> > +	int ret;
> >  
> >  	guard(mutex)(&proxy->shared_desc->mutex);
> >  
> > -	return gpio_shared_proxy_set_unlocked(proxy, value);
> > +	/*
> > +	 * A GPIOD_ASIS consumer may vote without ever setting the direction;
> > +	 * count it as configured so a later user can't reset its vote.
> > +	 */
> > +	ret = gpio_shared_proxy_set_unlocked(proxy, value);
> 
> [Severity: Medium]
> If a consumer requests a shared GPIO with GPIOD_ASIS and the physical line
> is already driven HIGH, does shared_desc->def_val still default to 0?
> 
> When the consumer later calls gpiod_set_value(0) to drive the line LOW,
> gpio_shared_proxy_set_unlocked() checks if value != shared_desc->def_val.
> Since both value and def_val are 0, it skips calling
> gpiod_set_value_cansleep() and returns success without changing the
> hardware state.
> 
> Does this result in set_value(0) acting as a no-op on ASIS lines that are
> initially driven HIGH?

Yes, set_value(0) is a no-op on an ASIS line that starts out high, but
the behaviour isn't new. def_val is only set by direction_output(), so
an ASIS consumer always sees the zero-initialized default. Its
set_value(0) then looks like withdrawing a vote it never cast. That
was already the case before this patch: the original driver treated
low as the default unconditionally, and b30973e8c392 ("gpio: shared:
make the voting mechanism adaptable") kept that for ASIS consumers.
This patch only marks the proxy as configured after the vote and
doesn't change which values reach the hardware.

I'll fix it in a separate patch: when the requested value is the
default and no votes are outstanding, write it to the hardware instead
of returning early. With votes outstanding the request stays a no-op,
as it should.

Shawn
