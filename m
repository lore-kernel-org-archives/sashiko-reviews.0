Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498720;
	b=cc/wN/tMlz756ntr+BWPnA0Z1JVRLns7zXapNpS5DDYJ4rqw8WjcS9+86bwqeW8Zp+Xk
	 PVh4Yhdr0vkiKUexl4xXa59T6mFH78miSDKBXUdi1qZ4baPhwIgbt6Q5Zn6HcEtk4b5RF
	 2OmFZITTo01ju+x+jJPlLLmYQtemLgk2aWg3YBGTOkdsaDVAGDpMOAKZ9j7Fuju73BNwN
	 RlX3kD+JySaaxGROASQwQ0ZVgPiddVg4gtEMaKpX8Iqgt2eFAUqOl0JP0Vtn/D/85uZWq
	 MAzk3+XG9s/rI138+Cp8dzPpAX2uXC0Mpn1YuTJ+e5yIgyRcerU4oybBBjIRxkslsKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498720;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=t0yD/Hc3WmdrFx+rVDSPCXObY9qlES/ygocp3mUczfQ=;
	b=m0LbFeAoVZG02rFmbxuZzErmixGcUim5YhxydIrvMeEvFEUFCsCQD5PLp2kJXqvI/QeE
	 /zHO1/0d7c+rHeaELdXMn9g8voxBRqNoDU1T1xgqwNe7GIzpbDsWDghDoCz6Wu1ZE7Ryx
	 ITpaE9mkYWbAxhm9rbuUYXLmzOjkn/Rq8vDyjYn7rnlexgXZD95AHGsa8Ef9tkiwceP93
	 dbCn310BNPfpPAcUB8ieL6JqwY79G4Jd4zl+95kkSxrH5zp0+fqrBdAuLsE6supXhypjc
	 L5UiHgcUBVUzOFPp7q/drPh98LuLOHfxFffG4/lTn7RhmyuLkxaMmzNFciU5ggpZmFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hqw1Yv8J;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4327B606A31E;
	Tue, 24 Nov 2026 05:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4327B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hqw1Yv8J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=t0yD/Hc3WmdrFx+rVDSPCXObY9qlES/ygocp3mUczfQ=;
	b=hqw1Yv8Jg+wgnbdVwrDNKsTxRXqSo5AWir2KYZCs99U7xHfyutsLWn9SMb7O+E
	ewIN+UbIivKTg1K3dgDQ+t7aGRaEKFBr0s3CpWb48yt+9rGzWlcClhKMwLD/b6j8
	/8D3QtzABx04peKXRFSVD4EThtlf9/nR1oX2qOaCQfpR8=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3v2e6IgVrug2vJw--.61309S2;
	Tue, 24 Nov 2026 13:38:03 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: Frank Li <Frank.li@oss.nxp.com>,
	sashiko-reviews@lists.linux.dev
Cc: Jiaqi Shi <shijiaqi_develop@163.com>,
	imx@lists.linux.dev,
	Frank.Li@kernel.org,
	media-ci@linuxtv.org,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Subject: Re: [PATCH v6 1/2] media: imx: remove legacy video node control and format handling
Date: Tue, 24 Nov 2026 13:38:02 +0800
Message-ID: <20261124053802.608265-1-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awR-WfnTvAxN6Lcg@SMW015318>
References: <20261122114205.494704-1-shijiaqi_develop@163.com> <20261122114205.494704-2-shijiaqi_develop@163.com> <sashiko-outbox-227913@kernel.org> <awR-WfnTvAxN6Lcg@SMW015318>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v2e6IgVrug2vJw--.61309S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWfCr1ruFWrGw1DKrWUCFg_yoW8Jw1xpF
	WFya9rtFZ8JF45Zrs7uw17Xr1Fv39Y9Fs8ZryYqrWrtw15uay0qr48Ka48ua4UGr9IgF4a
	v3Wjk3yDWayDCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU0jgwUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC8BvSJmsFIruTJgAA3d

Hi Frank,

On Mon, Nov 23, 2026 at 11:56:41AM -0600, Frank Li wrote:
> Please check this one?

Thanks for the review. I checked this, and I think dropping legacy_api
is outside the scope of this series.

The series implements the three items in drivers/staging/media/imx/TODO:
export FIM to v4l2-core, drop control inheritance, and drop the legacy
format handling where the video node format is derived from the source
subdev. All three are done.

The remaining legacy-only ioctls (querystd/g_std/s_std, g_parm/s_parm,
enum_frameintervals) are not what that TODO targets: they are thin
forwarders to the source subdev, not the format/control inheritance the
TODO is about.

Also, simply setting legacy_api = false would not be safe: g_selection
and the V4L2_EVENT_SOURCE_CHANGE subscription are not implemented in the
MC (legacy_api = false) path, so flipping it would silently drop them.

A full legacy removal would therefore need to first complete the MC path
(g_selection, SOURCE_CHANGE), then drop legacy_api and update the docs
to point userspace at the subdev nodes. I am happy to do that as a
follow-up series if you, Steve and Philipp want the legacy path removed
entirely.

For this series, would you be OK with keeping legacy_api as is, given it
matches the TODO scope?

Regards,
Jiaqi

