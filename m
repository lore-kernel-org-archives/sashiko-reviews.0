Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8065536C9D5
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780463518; cv=none; b=FVjTtmcpcxgQgoTCQl91P7c6cOqTlPe9Z18aZTh4m1DgcGqXDhaXpyjwRhyKZg9PNsMhcm0vP5PRC15PcMA0v064ob4m0HQxYW7B397ZlmpYNDVY1cRMQL0oN9a38NTKVpYaH1ZG6IPZ9gpDJlzZyz+Ob4J0k+CVkFONhQ2D/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780463518; c=relaxed/simple;
	bh=dI2d2hdPhO8pG4rkS8Xu72Xnf7x80Fjf/iLbxzU4xgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7pleo9usVu3rGDHgCY45q/MVlegkzo+O5C4oP+myVCOmrdLKFnkqd1FozDMUWz2GRJOyEY9xynOjxIu3X67Q6qXOXPElsUoa+6BEW+HC+cLxdD9x3qkYyUfzh/40v+RNt0pIDoV+IuxW3hYKwL7FpRhxpMOYEkcSVX+1RP4oJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=ST5zuWrN; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="ST5zuWrN"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8589498839so1694060a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 22:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1780463517; x=1781068317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/5AUHBaaAH4PchERy95hly+rUDKZQeYMFCdOcSGWt0=;
        b=ST5zuWrNrtB/aY08z0tPGNIVokGkdACylRpVL8GvuVI7YbMJEHmAyIhJNwr0u+gff8
         xLQGoQDhg23kZ/2GdaqalYXvCb8jQvlGiSGTqrE5cfMuaIuzi+hqEFG7oSqzj3+OLxRj
         Jfdx+fHR2btxbtPhh9gnFYF9Nl/eN5nTQiix4EnQTCVk7uwph+6NJVOVhfmJsS7nwX+O
         5Op45FBUUwWO2DgjUsamnnLaMTkCemycrOPj/r5wDiauMVACHiBEVirHleCIt6Aq+Kh1
         qhdz514AKdEKnMbOv46yVUAkclk8l7VsjW5Lud2c+AoQXICHRDueLIQN2eZLhjH75wZu
         RV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780463517; x=1781068317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/5AUHBaaAH4PchERy95hly+rUDKZQeYMFCdOcSGWt0=;
        b=VMwLP/jFVPkyVovTKfPMm2R4HAE4yBDUyv6Ane5N/w7CAXxeW7hbt6MbOCWWH8Tkff
         wkSUyAN/Mwi7ovoTjiCQkQYvzQPmnGvnBa3TQZ9IRTUIDQOAcATCGXIHsWIR89ylSmtX
         lOVTKTnqtk7xfnb+vhhY96Jb9DWVGhFdjYvffojEeHDPkZYJtI6Y6YmmtNwfQQp2rUjl
         3uEw1aHEEArGQDBNTjW916QpOlxd0rR4nncgrdoa2sjX246yowzIV+7RvNw1GXeiED6g
         2i9t9Zz585wjedtUiK2/nAvj6srg6l3+di/e3UPPh+hKG7QaoeCf85NAxoSxWUn1QxSF
         FU0g==
X-Forwarded-Encrypted: i=1; AFNElJ/b0OEwtQV+M28/5B5eyWteQaeBuY9Y/dOaoJQEvo8oOalfrcmOBMv5UN1XnpyqZiFhLW+oQQnNxE/TAQgumaw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAP1cCnefVwpJQaOh0oaE8aQHO8jC5J89oPw29bqq87GqPaXq5
	fbuE9tYfZSs9yzMtPJ1vGsPgoRpiVRhhOu7lpW0iabihqItGfX2cX6aLfGMKgz51zNU=
X-Gm-Gg: Acq92OEG1/6l6J3dTdoGS/QM2zMio4B8V9x03Lu5YdkhSHzOGxIgehqo8PbR6K6MinZ
	r+rN9XzZjYOyeH8ksxAlQSusFwws+eXw1j5EDZymSaL4a9lrobMXtGtAFdLxFpnDPPpictPxBSj
	/7734+knPWJ4aEotzGumz7lyxhX/dnl791J0Of9QmjWSeJ9bKAt0gvFnYSWvIXSjHqPM8Q7UGfK
	FY6z2KIDr36qG78TEXo9Su4pcNCu9gC+rRty0cilpFqQp7TFs30VZZDbMNMmWXbLMXVpr+8u3AE
	tP0516qDytC/2i7qg+IDpaLmjrdC1ng0SRxeKwacpRV6ki9JqTT/HgnociEnwu+Lp9pjgChrtjA
	Qt31WM9Zx5EF2jwQr0dpsbaM33ubMtSUlbNsxl2XmNz3ooPXgAV5TFQ0TcihpUjXXGmhgduNSSt
	r/0Srib4G7xZzYJUrr050+7WF9DDPDZ2aaJeU5
X-Received: by 2002:a05:6a21:600e:b0:3b2:8685:118b with SMTP id adf61e73a8af0-3b497573daamr2027650637.20.1780463516738;
        Tue, 02 Jun 2026 22:11:56 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm942736a12.16.2026.06.02.22.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 22:11:56 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
Date: Tue,  2 Jun 2026 22:11:53 -0700
Message-ID: <20260603051153.233164-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529063523.959FA1F00893@smtp.kernel.org>
References: <20260529063523.959FA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - focuslcds,e35gh-i-mw800cb
>
>[Severity: Low]
>This isn't a bug, but should this compatible string include a hyphen before
>the cb?
>
>The commit message specifies the panel model as E35GH-I-MW800-CB, but the
>compatible string is defined as focuslcds,e35gh-i-mw800cb without the final
>hyphen.

This is just punctuation in an identifier, not a desriptor issue.

DT compatibles need to be stable and unambiguous; they do not need
to mirror vendor SKU formatting exactly. 'focuslcds,e35gh-i-mw800cb' uniquely
identifies the supported panel, and the full vendor part number remains in the
binding text and commit message.
