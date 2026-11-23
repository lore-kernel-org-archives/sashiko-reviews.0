Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464525;
	b=SkSyEBKW1jILP0mlkgHxFjXFu6jDZHUN8KUU3d8edrvOp8ZaUPNhwY65LbTAyULbVOfz
	 E68qGeqGttKZgHTDqzmnCzvXnpLYxAJ4Il6KrtGyFlhIE0svIs2n4D3SLCxFBj7qiVP+7
	 H04bQRoeBKwYiGrQKoNk3E6KhgbBHtu8WV6qP8GKo7Dmu9bJmTYX0tQCgqZCMJ97TFbNu
	 4hHWjkZMlNUyOj5gLLiwItZS5nYBGpq8L/VgnQqXZ0NUZZOq03IO1X6Hkuf8yzSccXAqi
	 vLOkG539wOyzOGGi1DYNpWkVQu98pfGibgkDS+4vDPrQ5ESIdDqCpAxQBAd/cmftRvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464525;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=gNGrlpJ5GBGLYgkbdRirPnoTxZGSI1GUcCCkis3/WLY=;
	b=SDFkvl1WiZQX2X/wpf3TnQb6+Y1JvbfK4TLExKlG79tEAHkK0szGYbpRukRLk1Le1enL
	 6B29/gGIZjE1Cn9r2/q13dpmzbjbxLRDBdqKQvnatz73eDiVvml7YhcNNx90UVjZ5+DOM
	 /m6e+gXMc/8LxOTVwh4Q8+OXD550QjtTAvRSIaAY1f7XQSDxDRFfPCnxnOkn8F0I4GCot
	 UQy6gjUGExs3jZGHA6CoGoijHmIJep9x406pFFQqIq0RKgSxPYzAF1JqYKziz8SpQZVhF
	 LM7G91kX1A3DEQqtMeyYp2na0zfApCHWROyyLYFidA3+QKvKu/iEzyXaIe124nJzXtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4EenYoqU;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FF4606A326
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 20:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90FF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4EenYoqU
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id VaCqxVHw3AR1iVaL8xbfSa; Mon, 23 Nov 2026 20:08:39 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VaL7xI9KJuJrPVaL7xSk3j; Mon, 23 Nov 2026 20:08:37 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6b049d46
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=S-ZHDvpaSbKS-1XEJIsA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gNGrlpJ5GBGLYgkbdRirPnoTxZGSI1GUcCCkis3/WLY=; b=4EenYoqUwKLVxFO6ApN1BAtn1h
	9g9dniMYtL8cDLa5uCobumqajKPCJIJoW/lBuSWPWDYiy+XCmlX6XJv9YeZS4Fr1Ng4+s4MrsNYd/
	7qkK1f20niFm3try8mq4GfQt+LVIU3bz61JMbygk+E0r1NuhTlGSeLl2I2lrGUkW6rjEyftbGBU9Z
	goKiId2MfM2etgos7XZSfwrw05LMeMpbCfDGq/I5MI8NHDEtFJqgwRE18BG8uSmHVMlM3syiC6a1x
	3EcHJ329+YBuXhVro7TCMFn6KK3SnNNG2PDPhH78mcRHMNRjjxEWMLwl+V8GmlZZU8WcpUFkCB1fa
	jqxbWKYg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60550 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVaL7-00000001cZJ-0V6J;
	Tue, 24 Nov 2026 01:38:37 +0530
Date: Mon, 23 Nov 2026 12:08:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH] hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754
 chips
Message-ID: <88719c0a-24dd-4714-8729-bf7deee35dd1@roeck-us.net>
References: <20261123-ltc2978-ieee754-peak-fix-v1-1-96cbe686ab67@analog.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-ltc2978-ieee754-peak-fix-v1-1-96cbe686ab67@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVaL7-00000001cZJ-0V6J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60550
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGrVZ5+g7V+szsIp+UwiGpxveE3ZeDm4wUnfKLXHImky1OwprY5iq7gNgeNH42vFTmSjXs+GFbgG2Flg6ZPd6p+oHejktSnxOp892qTRu5diky+AyEml
 yUPCvQXVvjOjOGCDrdoeFzbTJRaA+qVD2H1oTRdrBLuPf5Z5ycRALDLGcOiQhs6gWPz1/gwOxOMezDQPJaxBLKsYTqdQ33xJJetsfmLS3vgMiw688LB8z6Qr

On Mon, Nov 23, 2026 at 02:52:02PM +0800, Christopher de Guzman wrote:
> The LT7170, LT7171, LT7175 and LT7176P report their sensor values in
> IEEE-754 half-precision format, but ltc_get_max() and ltc_get_min()
> compare peak values with lin11_to_val(), which decodes LINEAR11. Bit 10
> is the lowest exponent bit in binary16, while LINEAR11 treats it as the
> mantissa sign bit. Positive values with an odd biased exponent, such as
> temperatures from 16 to 31 C or input voltages from 4 to 8 V, are
> therefore decoded as negative, and the reported peak stops following
> the real one.
> 
> The peak start values have the same problem: 0x7c00 is the lowest
> LINEAR11 value, but it is +infinity in binary16.
> 
> Add a FEAT_IEEE754 flag for these chips. Compare binary16 values as
> sign-magnitude integers, and start peak maximums at -infinity (0xfc00)
> and peak minimums at +infinity (0x7c00). The min attributes are not
> exposed for these chips, but the min path is fixed as well for
> consistency.
> 
> Tested on an LT7171-1: after stepping VIN from 3.3 V to 5 V and back,
> in1_highest now reports 4992 mV instead of staying at 3294 mV.
> 
> Fixes: c1d6afdbb8ed ("hwmon: (pmbus/ltc2978) add support for lt717x")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206843@kernel.org/
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Applied.

Thanks,
Guenter
