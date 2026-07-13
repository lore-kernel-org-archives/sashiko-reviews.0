Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E492357CE5
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971465; cv=none; b=gjBFAdtubtXzh/JfJUXZsPGRg+km7SAkXMgF7umdqZ1e0KYlApSCExh+fKYlkMRxRz/XrNXy9srjFXvbzp3sutYXjEVhDxYmgjxzICCgeVu5nXRe927CKQkowkbRScRel2H8ZJbz2Q1CbxQWrmgJMhvG1YGJRv1ZSCTuYxLTcAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971465; c=relaxed/simple;
	bh=fkT9lRkMwYghu/2SsT5/Spxavix5VefOiOOVGSHvrjs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VWEAEQXDbLXL7UvPsY76LuzPbuVfKwwucPzFeAY33imjTrwJite0LOKro2brq/VArrI+knQoAkloAt/D7GmXMk+ZfnoAYk/iBNk4XoqMklef3rTNnRF/tW5/5IRWiRuGfRILPDGAjyyOEBZtIqLEdTqPOWRzgtpmt8eORXx5NMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPnNIsFj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPnNIsFj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so1536515e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 12:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783971463; x=1784576263; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fkT9lRkMwYghu/2SsT5/Spxavix5VefOiOOVGSHvrjs=;
        b=bPnNIsFjZWZkNWSatbQEgfQwxdihlU6jTNDL5Pq+0eHyUttFxO4MrdY+ROhSN6eo85
         Ifbl3dMZSgmRxetCdf795Q59RrVAURJTMtw/T8rXM0tXywlLl5e0X/Y4G91zj6daQyBR
         Lq6RV2YOufjmuOKphL/umAsZVvNbhM2wAricDf8jy9waEKIa/6pqYGnQV7qLOtljNAqg
         khodqWDJk1n5EMzLphYgFo58njWyErwsjbmnQx86iA7k7WaDCAStqxTV86rnj0fWTeeX
         aAuIZ0lErd3q+c7OJ1ohclJyLnQKi8R8DfGGL8W711uvZwi81z7y/kIUj9GR2frxa8qV
         Gm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971463; x=1784576263;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkT9lRkMwYghu/2SsT5/Spxavix5VefOiOOVGSHvrjs=;
        b=JvQaDhEsDthL0j48LwNEILTVPpF7GWKLD0FOeoJPiIHVtC54v4ATgGJS8iSh822slF
         vpTb7cBdr8WFIZYM2BlA4exronC9dV/j7bF72PgeR4EOEKLp5CX3GGeZ3ojLHAMPuCYR
         yxYX5SRYsoG2TzU+/o7BE1uElXtvrFMLbBzZjFUiKc74NrVXGj53B8H6ytawmXPMtCNa
         yOSQYh8l579DXNIqanuUV8BFwQjLXnaTth3HgVHnDIQjCb93TlDrFlQj3/M/O5lGIaPh
         Hh9kNWEMgAz9GX4IyR614AP5dbUZACkcuxNJI8TFuRiDgGj/mbGGeMRX2mxZVZh9Rqim
         e17A==
X-Gm-Message-State: AOJu0YwJOUYIXkq5e5QbR7J3/KNIper0tq85XSwVZcFH3C3+o2U6R58I
	X4+EQJMK4q/UGr3LvFDk826w/rm5341P2yLYt5DWJWdJXZ+eFdWfy5732HOyfhBSPec=
X-Gm-Gg: AfdE7cmJGb7nCjA9Ul23QTCRG89NGfxS6BeAsDOG4y8h41cmf+mp56CQZcTTdMbn/ZX
	YODR607GEBTZB7QnCfdECthpv/XNPs/YuU9HjY80XPqeGI2thrR5XGbJAYJgyPkez6dsVAYABVC
	UuUI/ixET5FnVmiWBVJ0okVuyhimNgvzxMKGoFt39ET7uNjaUc5iQP6b0w1/sxxVCRPK3UEP76w
	y32Zd6eTQQG+Pm4PFYOi1FDXd9W2Pr18WerBvYyshYAJPjZ0lbuJh33jnZp+C0g8w3xerreBgWA
	K5UzydZwqf7Tnf6Bfk2d4lcISCyb8V0oD1Lo32mobEXAl7eX7LkiMPSK9LXa4Iz1g2H6gIejQNg
	TJIAaMGR6qYEJdzQtDjERJ04cVwx8c/rFzt17jl1Mh5QGhxMmiR5RXnmdHFktmEFj3IHNkLRaQe
	LnqOXnEoQojNiCRZOa
X-Received: by 2002:a7b:cd13:0:b0:493:cbd4:8925 with SMTP id 5b1f17b1804b1-493f2a85bcbmr128448055e9.4.1783971462835;
        Mon, 13 Jul 2026 12:37:42 -0700 (PDT)
Received: from localhost ([193.30.163.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm2025314f8f.22.2026.07.13.12.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 21:37:41 +0200
Message-Id: <DJXP3RGL6OH2.2FBANQ2HJV2J4@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/display: Use drm_edid_block_count() instead
 of raw extensions
From: =?utf-8?q?Timo_Pr=C3=B6mer?= <timo.proemer04@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, =?utf-8?q?Timo_Pr=C3=B6mer?=
 <timo.proemer04@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260713183841.5921-1-timo.proemer04@gmail.com>
 <20260713183841.5921-3-timo.proemer04@gmail.com>
 <20260713185052.9251A1F000E9@smtp.kernel.org>
In-Reply-To: <20260713185052.9251A1F000E9@smtp.kernel.org>

Thanks for the report.

I have fixed this issue and just sent out a v2 of the series.
