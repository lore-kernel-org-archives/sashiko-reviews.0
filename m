Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678314;
	b=bJ3MxxqXuQRjbaFmeI5apNPRiI8yakiFIZizmGUzJnckuaMDxO4YwkOtwfmNXYO6CLV/
	 A95lVTSTvSxIwuYgEmPwItRWpVuDWf7AbqydDUY7Ouf6Ut6pFzheQZBRhQ4hIcp5kZ/HW
	 VDDT2AUm5fBXD8JJLWV99Z+zLkwTC7wotEWGy8d+Tje6Pv1uRZseTQfielEXc5fOYv5cN
	 2+lGHhtpJcOXxx59kWyx8fIqP20AEau9EthGrsjaV1T21I0wTlcJzYQPhvx4o63QLNsqz
	 HqlfzSMdnlVfZv4HEx+HW/2a8NbXdpOUjl3xBRuT9OyLhfTX7tW+Jvsxx22tRTBjHOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678314;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MvlgLViOreb52RY6KLPY/X+KKSe10ZQuNkNnXVoW868=;
	b=WHNfgDv1OodHpv81pxdLieNiUKdIn13h2BiMIVsy1FupmImQid5h8AiWmqTjd+pZ7INH
	 5iSvey/nwdunUoA67ZaFJbNJ/7+KEibfvVckEdkVKNb9K9VfMD1E2R1biXeec2KKxyaBk
	 Ionk+eR7fvMisxSOmarV/1tww4UAdwSjKFAorAvhB82FLYuE3Qx3A5WG4z9PJVbyPkaH6
	 Fcd4akZdxi//h3lpVUpwOiJhj8L/5JgC9Bw3JIiCFcAH80+By+saY59nEJuhIanz8cZbc
	 2GhIIAi3ceh7ojfoOAVXmz4SsXomYGoEiuMHR2fr6srjCFP2agfc0E5CyVhL/18qhIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b="DGUB/jg2";
	arc=none smtp.remote-ip=212.27.42.1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF7606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 14:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96EF7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=DGUB/jg2
Received: from stf-laptop (unknown [IPv6:2a02:8424:8fef:6e01:68ea:cb82:d40f:9275])
	(Authenticated sender: stephane.grosjean@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0E7CEB00548;
	Thu, 22 Oct 2026 16:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1792678305;
	bh=lZP9WK9rDpN4lz/28lm9o2dGeBCOUKpKi3EXOl1dIEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DGUB/jg2hrLZHCfH0G8p+A3Ml6EcNWR5LspcUX9RNpoNHZhF3il2ca1Li5YwjoOJQ
	 MC64f7RZsNmIpFkMetdTVBPOe16Zc6Opu0knIXJVDeVTwmgjfS9T6dkcpzeRWB38Ad
	 Cz0iVgurB5SFWD8eMhVzpKleI09TIPZy9vV4LEo0ovItC331TNap7ba0GBrQ7jOFNU
	 l8wndQV52pinpqcOaFWqOI7sAIHxfwc9ETZCdUF5mabFkXkPTHolZ2JWP5zSSho7K0
	 ohL2NK0OhqNW3S9QsJ6mhfn0igmky42z0Z2+yvBwYfKpRvzDyygfINdYePBeM6P6Wj
	 B7Jcsi2XF5sMg==
From: =?UTF-8?q?St=C3=A9phane=20Grosjean?= <stephane.grosjean@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Vincent Mailhol <mailhol@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v5 06/10] can: peak_usb: harden channel handling in PCAN-USB FD
Date: Thu, 22 Oct 2026 16:10:40 +0200
Message-ID: <20261022141039.220222-2-stephane.grosjean@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-179109@kernel.org>
References: <20261020-canfd_check_channel_idx-v5-0-a62b35b867f0@peak-system.fr> <20261020-canfd_check_channel_idx-v5-6-a62b35b867f0@peak-system.fr> <sashiko-outbox-179109@kernel.org>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 20/10/2026 16:17, sashiko-bot@kernel.org wrote:
[...]
>> +static void peak_usb_stop_rx(struct peak_usb_device *dev)
>> +{
>> +	struct peak_usb_device *d;
>> +
>> +	for (d = dev; d; d = d->prev_siblings)
>> +		clear_bit(PCAN_USB_STATE_CONNECTED, &d->state);
>> +
>> +	for (d = dev; d; d = d->prev_siblings)
>> +		usb_poison_anchored_urbs(&d->rx_submitted);
>> +}
>
> [Severity: High]
> Can peak_usb_stop_rx() race with a concurrent peak_usb_ndo_open() and
> trigger a livelock in usb_poison_anchored_urbs() or leave the device open
> with all RX URBs killed?
[...]

Right, peak_usb_stop_rx() isn't serialized with peak_usb_ndo_open(), and
an RX URB anchored but not yet submitted makes usb_poison_anchored_urbs()
spin until peak_usb_start() submits or unanchors it.

v6 clears CONNECTED under rtnl_lock(), then poisons the anchors outside
of it. Since ndo_open() runs under RTNL, no ndo_open() can then be
between usb_anchor_urb() and usb_submit_urb() when the anchors are
poisoned, and any later one fails with -ENODEV. An ndo_open() that
completed before has submitted its URBs, which are then killed as
expected, since the device is going away anyway.

None of the callers (disconnect, probe error path) holds RTNL, and
disconnect already takes it afterwards through unregister_candev().

Thanks!

Stéphane
