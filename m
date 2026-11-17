Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951682;
	b=MnlSFnEWQGN5Ba63XrO8sd2JZ3w4hC1HXfE3ku07G3vKSXLn9MY6hasicj112a9xdd17
	 6jtrUyjRZYI11AyPK/l75biEQaFymQOfn8tFCbKYrW1b+N43izS4WJQv13rxoH4vPxz3Y
	 +SlXE4R3qv1CezOP8lucYGW9OARudA7jUlwB2eMVmxuCYx20TGsaifY0/5oxg0Onme79F
	 /4XS3IwdMRaixhaWjDZyuBnsddInBO9oA3ISOBvMAdjOi4jX3seVJiZevOHDy44vz2rMz
	 VNFLlNTXRRJ3jUXzE+Le9/Ie7GGUiayQ7IO/rY6SSSkH1YJ3BkrAVwENXCoTUIOmbjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/GHQAMyTcVgW7kfw1l2Fy10gQWmLXDGkkGBuXSUeJAo=;
	b=12WOGONH+dmZIwBhlMoiZGfh3tjCtZLT8QquzZrZ81y5TdITfzhdEbS4eEcwbNMJqzEK
	 zsIW/CVI4NteI8zm9tqmUfguCvou8iz19tqX1aPF4l4Lq/pR5opI6mDOYfPv0gu5Ud4b1
	 bbJK2pYT5TZqe7pkspDM3bop4eBd5rFrFQnboyMv8TGf5Vq+TXphGNHXql6iG7BGs+tyG
	 8z5Myc6nb7s0tQAfCQ51hI/Oprlpd+LKri/iAKWWeKq7EO4mIg5xkeJAAHj1fEY0XCWGJ
	 /V0/4ZMDsBBVFI3jXKUDUc9H85Pm/fXgAXYDgBarlF5pIsFmBWP++bx749HTjdJL7Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bbVvYL3v;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769CF606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bbVvYL3v
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so1684427eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794951681; x=1795556481; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GHQAMyTcVgW7kfw1l2Fy10gQWmLXDGkkGBuXSUeJAo=;
        b=bbVvYL3v1mnzsq+rkNCFkG28HujknQiqfgdGn6wB913XfWKmZeeQNbSG2XT7+zc3cg
         oAa1pN9/Hz9fAWcFOtMg5pIFk38pKzShXAD13VqvDmHXj1xOQN75NDLMavhPkEpstbbH
         9vjhfKjDWDPo889r/PTM86w/1I8D5oYZRGXiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951681; x=1795556481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GHQAMyTcVgW7kfw1l2Fy10gQWmLXDGkkGBuXSUeJAo=;
        b=tMh8OmJ7fS85K9dpuwDG6b+5oZ/yZ8hnx86wWIWkM79geqJSkU+AiYrXwtkIxb+hZe
         Y3/X7rF0S6lt6UE7/322XgA4MgHJAhPfzBdVetUPxmaRbe349GUPTequl9+EaVZr2Nx4
         Ck0r3ygQs79RnK5I6OC6LMIU72GM2nRitjvXAI0ozGWJ/OB89PZC4tbKQLpi5ZLdF9mh
         cfJQ5QlOtBiUYLd5RQpoArr4C1M3fYimpBKa95AjUUhVOc9ALRhL+uBo53xccgSN57IS
         F3i4jj6VYXkw1szcKSbuPf6Df5/cYXzOfYME5HzZctNFkYbO134wGVb0mLlQnwOtc2Yy
         C0Og==
X-Forwarded-Encrypted: i=1; AL+hErEEF4DpGAp4Cq7hspCneG/0OppsJMi6Qr+Yes4rhUXt31FVdePeHQgDfWAldc92t9Qf4Lw52d+KD+s2qDd8dn4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+1WoTRVOi+Xo2OOgFTHEzjLKIzzpfU1QUmbIC1uqqlWqrI2zEP
	W/idOVrV6EHv52pfSTfSpPQmniTgrzBSysQKEqSeFfhIjDk8Y59lwvvwQTSOcxYNFw==
X-Gm-Gg: AZFdTZeoCeZZNj2OK3L/2Yh2my86Ao8GAss1e1vN5CS5CQ5h4LXNUrmRFcWCXR9gSku
	C0ep/WQDdopmqemJjwfRm5Z+ewcT/ZbLhIHePc9zTBPU3NN0lrtjKj8NSYIhuUWynIDZhMv7bUh
	YxfM3W8R7R6qpDI7Pg+O784LTfBCzFDLgkpyM/P2DvnNJPzJFHAW5JIX8+TCtU3EmoQdfwdHUTh
	9y+flTVyxxZ42JZjyVFVdmS6660iqnQl+TOJBCfSV51yzLRjq6wd/9lpW/aYFxGUP3HmuNkWAhu
	KhiC4ZfqNXfxSyd5+TOCb7IAmhA6lqiZ0/H+TUnaURTDoZKdlwZ+qra1v3wuUDGIUf5eERZy5Ff
	uX1ejpIqJ2vKv64HjPyU02M9XZk5f+YLt/eNBwv8ycsNL9+oKDk5TB0ImOsimUIGjsgueY/6jbh
	1GCyyVe4n4I5HZ5AJYq+BytLmeRattZIASJjdTiDgbGlD9o6NPerdV/x/34/dMdQhOaEVaO6ClJ
	oLXVuUQ4AueKlcjyNg3DrpUAsX5/5g8c5ojSFscjxtom3xhh0qwF2oGhCFJ5N4BJVOAya0Y4JM+
	HoJZkUqVW7tCybMOaIT9injBysXMkMo1JKpThchqriE7w4kN69Zcp6kiCi6KF8pw3Eu3
X-Received: by 2002:a05:7300:fe49:b0:382:75b5:e77 with SMTP id 5a478bee46e88-38275b516f6mr736632eec.25.1794951681348;
        Tue, 17 Nov 2026 13:41:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-382a6fe75b5sm678252eec.15.2026.11.17.13.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:41:20 -0800 (PST)
Date: Tue, 17 Nov 2026 13:41:18 -0800
From: Brian Norris <briannorris@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: 'select' GENERIC_TRACER, not 'depends'
Message-ID: <avzJ_uvfpL2nPij7@google.com>
References: <20261116144652.1.Iecb63200dd245f62032a3b1f60ae78cc48868094@changeid>
 <sashiko-outbox-217828@kernel.org>
 <20261117085552.0e4ef272@gandalf.local.home>
 <avybp3O2zxcLozKB@google.com>
 <20261117142203.72235895@gandalf.local.home>
 <20261117142310.4f440b3f@gandalf.local.home>
 <avy6nTb0ccqNNnOo@google.com>
 <20261117161011.59101930@gandalf.local.home>
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
In-Reply-To: <20261117161011.59101930@gandalf.local.home>

On Tue, Nov 17, 2026 at 04:10:11PM -0500, Steven Rostedt wrote:
> On Tue, 17 Nov 2026 12:35:41 -0800
> Brian Norris <briannorris@chromium.org> wrote:
> 
> > On Tue, Nov 17, 2026 at 02:23:10PM -0500, Steven Rostedt wrote:
> > > On Tue, 17 Nov 2026 14:22:03 -0500
> > > Steven Rostedt <rostedt@goodmis.org> wrote:
> > > 
> > > As it doesn't need to be visible let's still have:  
> > 
> > What's wrong with visible? Hiding it is part of the confusion, because
> > it disappears when you select something else, even though it's still
> > effectively enabled.
> 
> Well, one thing, it's precedence.

Do you mean: because that's how you've done it previously? Or
precedence, as in "other tracers take precedence over a visible
EVENT_TRACING"?

> But another is that you can only deselect
> it if everything else is not selected.

Right, but that's pretty typical of interdependent features, I think.
And it's explicitly represented in the menu:

 - the non-deselectable item loses its box, to represent that it's no
   longer a checkbox that can be unchecked

 - if one wants to drill into "why can't I uncheck?", the Help option
   gives a good breakdown, with something like:

     Selected by [y]:
       - GENERIC_TRACER [=y]

   That gives you a burn-down of what other things must be disabled if
   you want to disable it.

Brian
