Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F4236A370
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 23:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106068; cv=none; b=neS3bPPHn/waL21X0Dy69q0pma9RWFTeCkIdrv7KY2AKeJ6lL/sMtA06rpKN6Pr5JrtzaSCd9DBxJkXQVbIzW4J3YtR53Aq3VR3tQZtQ9Y6A3hUxhpvXAT+uLWzLgTOaqc0iPLOej5exmLK0MGL54hnlBSpbQQgvYlFteSV4A4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106068; c=relaxed/simple;
	bh=G1VWVzqgtNFSdZ3tdadaIkj4EZd0Y1m8BQMjwsAXmlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iw1qXKpjNy42vSbXKprd7upPOdBuyu+fHTy7lwrovCHij10fTtQow5Xoirudn4iPNmUkUpzpSwIhpfU1MVSrnwCwoWC2QQuNNIEgDvE2Q6Roy9VXpx8AIOGrW18eP6Uth7o+yMPOUu95iuB8EocYrDMH8Wv9I77/LUk6qUGGIlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jahLhWE3; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jahLhWE3"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso878447eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 16:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792106067; x=1792710867; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOoDNdgbqEONnRhnyuTwsgaYEHRZvbrYhwZMQUhYOFM=;
        b=jahLhWE3Elj174/WZ8gu7z8HEQUOiKAnGn2dYo8QVuzyq7ypZnUvCRw0DOZD/udZss
         VRgNy2iPwvzExLx7f6j9fb3hH7nOqqrNzD/xSTh6l+oVM74Jqo3XeBEvfl9AwU7qzOcQ
         ROgjIjQ1qHJZlT9aySx0MDB8NIsggB54VMQCQ2v+42UlN7H4Kqg5lxDQM2TXkNgEbhZ6
         hcgwqRmWG41LoowqVuKDBJ6IWLoq0c5YQxm6pkyF7vwmn84OwD7a7IzHBaspTk3UNW6+
         9ANZJFbJ/K6uokRxJibDrxV0t/SLVU8tRUr3rINAZlW+jOFmScZVda9tE5MBLw38pS79
         Sx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792106067; x=1792710867;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOoDNdgbqEONnRhnyuTwsgaYEHRZvbrYhwZMQUhYOFM=;
        b=UTf+fPusqXv3NAS8WXHQ4KIrfabW759pD/ooGrKHhKqw5+aPW7wbPH38BW+1O0VMOH
         hvCh3h+F3ERd+1nFK3/QrIphPCbpKqWAoMEhMYhpoYOEWpgQCa/oV3Zn47CLd8TOxqLM
         OUkqrd4esb9PDNVQ7VHJNlT9LFdKuUAtuEU+l/ABa+UKi3Yj4m9BGwsjs+6RTrrsM0J2
         qVEwBKBmSIt1PSHmEpy8ecM6W2XJu8CMgRnLv9sDjO3q+1FRFNr0dFx41cuppuTV0mlS
         q/A+iZUGqSe4911ILiukPAiwcgKHx4OXnHkdgXUew+51RGZgp6oFR3ziMSa9pVmJtmIM
         EDVA==
X-Forwarded-Encrypted: i=1; AKwUvBz0Sv/xYYkZeR2oDVvwk/GWzBVtcalRsK1MitJefy7dYoeiJ9V1JVYZPYTCmnFjukhcx27JZKwQof8+9a9PBH4=@lists.linux.dev
X-Gm-Message-State: AFq9FYIiwNmJJMy1OQlLnZCdPgToYgIheMDCqsjd0BFQHlK9BTA4sQNs
	pdTh3IOCEiTRdDrvSdlYmmSKv/2i38B3G5aTL4J0ySIKw/CZY4NYcnjz
X-Gm-Gg: AYBFou2rKPeeMViLuEH9MjcoIEwEQ2PvHAKORHHfhQyIsqoTZnlhowOpf+Hn5wWGu7X
	eTA+TiDw242Bp3wT1K4N24iDx/9e0jptr6WQfppZymkXgw68HAWdKJRHl1u7h8pSFdkAKSkKAfq
	S/tknxbtkchvERNqMwhJrcZgpK9FlQC7liu/ktXK+iIfJ8ZhvLe1LB1uIZrAZVTTh/FMeotaBiB
	NKzSUtsVORdyEg9vsTrxIuzMaVcC6UbiUzNKlJG66uDB/0gDZhpvnOtk4EMxuZMknKRYNO06w+e
	aj+1hTsk4bLC4j7IPJtn35o6sbnds4JHsULL2FQSTO9vpZV0xkFJ22pdobq//YYmvC2mQI6cYat
	a0gXl37DnKmnRSXbDI/EyGrDpjFULk51MjZEuVlGdXBzQNKnsm3WZn2v7g2VAit3eh+qy/kMh0p
	dAM2aFztTeOiICH05fdnHcT0KYHqF/DI2DxeP/xkqbubxTPsd7ptV8EvKzwUnBGAxU5meQk0PHt
	FqUjQIpCOPL6/kJ70WlEIWmiU5jsCVx0qZJxKiQ2H65vMPbzMq/bt8V6xWIlFvm+DBxjn7hxoPq
	nZMk3yrvS95B22CUXlayVV0g4UPfLFLvCtSppx4TYFjhwcPsXwa5DrpyKSqGFZYyBb9PjV4=
X-Received: by 2002:a05:7300:d191:b0:353:7f50:a99b with SMTP id 5a478bee46e88-3537f50ac52mr27374925eec.6.1792106066501;
        Thu, 15 Oct 2026 16:14:26 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2804:7f0:b100:ece0:446b:100:5c81:b436])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm1262967eec.0.2026.10.15.16.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:14:25 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>, sashiko-reviews@lists.linux.dev,
 linux-security-module@vger.kernel.org, network dev <netdev@vger.kernel.org>
Subject: Re: [PATCH net v2] calipso: update payload_len when removing the
 CALIPSO option
Date: Thu, 15 Oct 2026 20:14:21 -0300
Message-ID: <179210606199.96599.8994346249690707193@gmail.com>
In-Reply-To: <852c9fb6-6217-440a-968c-b5ab3e22dbc8@redhat.com>
References: <179147329205.58079.5847298721173675285@gmail.com>
 <sashiko-outbox-165773@kernel.org>
 <CAHC9VhS+bdL_YnLQtd0sPmKKfy9BvS-LWV_6EhAuu4qfUFe_mw@mail.gmail.com>
 <852c9fb6-6217-440a-968c-b5ab3e22dbc8@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 15 Oct 2026, Paolo Abeni wrote:
> The above looks like a pre-existing issue, the patch itself looks
> correct, right?

Hi Paolo, Paul,

Yes, the issue is pre-existing; the delattr patch doesn't change it.
The skb_pull()/memmove()/skb_reset_network_header() sequence quoted
by Sashiko predates this patch, which only adjusts payload_len after
it.

I tested Paul's idea on top of both CALIPSO patches (QEMU, veth +
br0 with bridge-nf-call-ip6tables=1, SELinux + NetLabel CALIPSO
DOI 16):

- without it, a bridged CALIPSO packet towards an unlabeled
  destination reaches the peer with a corrupted Ethernet header
  (garbage dst MAC, ethertype 0x0000) and is dropped; an unlabeled
  packet towards a CALIPSO-mapped destination never reaches the peer.
- with the nf_bridge_info_exists() check in selinux_ip_forward()
  (plus a stub returning false for CONFIG_BRIDGE_NETFILTER=n),
  5/5 packets are delivered unmodified in both cases.
- the routed path is unchanged: delattr 5/5, setattr still adds the
  option 5/5. W=1 is clean with BRIDGE_NETFILTER=y and =n.

Paul, if you like I can send it as a separate selinux patch with your
Suggested-by.

Thanks,
Joas
