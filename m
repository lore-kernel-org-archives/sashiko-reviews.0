Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D926ED33
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 04:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788927232; cv=pass; b=KpiAJJjW9ZgW4uP3XP443at46VykC7OJXftpx603Sqik8xc3jCJIf7wrlYILB6Ls0lG4wIgZQM3HmzSNqaUTCSEaz6dnk9CkTzlCbuRHXts+6yrBGrihX6v59K6kXpz+UiEruQT6rzJkf7QxQuuHn9T9f+ksHhWFhdOWfddDJV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788927232; c=relaxed/simple;
	bh=VbbgDs8vchj2lrFK5eDi1gvI0D0IoQpaWTY+VveU7Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5sAycEkpbLaddfj6MHGhRYa+Z6YYGmZIrreKMFsElkuGaXACePO2aoVv5Of79BRoWayjHx0wNo6kb995o5lQVHGlbifsRDTWaVzuGrl57wjIbSWeryYVp4jcgsuPcNFTiE2NR+2UxWkr2/c3xFvVG8KnQ5unN2tTtSujGEdCL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCfbydus; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCfbydus"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so6050785ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 21:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788927231; cv=none;
        d=google.com; s=arc-20260327;
        b=DtmJ68DqRu3EOOMPhERYZZhZXdGYubF2D5Bju1ED6ixNU4xNuBCHJkbVpLFbKbvVMx
         IBMT/yz2tRQLzfFAAZuAku7le/hqLzXZiqa2NMja8w9muP+zYmke6jVu/fpZEbjVpdTR
         OEntUZyjgxTBx2RJyupwadYAaqBV12RdIlrzOca1BLpZlvyiAtEv78wlV9xgVnCNqVAJ
         6yoATX0VArQxRkOByZvVyK0OxSxBHKKxFFTeqju9ezLfTkNaIYMWG7gIOeE8BJReOGP9
         h4YbcjdSqtg+7MtNmbEqplpNzfVmQDVUpRkOfNQl6byRbG7nQbNbBJgzPFprjFMa3zci
         ZOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VbbgDs8vchj2lrFK5eDi1gvI0D0IoQpaWTY+VveU7Sg=;
        fh=3mbWQc2KYnV1YBFEjtPx/1jzUpC/uZUzPfAesf3Pc0M=;
        b=U9W90iwQHSWD0Njhh+LouV/H1ZU48B8whuFLB1u9C0eXJYWAXzS2F2rhIE2zS+IDhq
         RBoQ3jKVMMdKdF148Os2pQsJO1A6HsKZr/7gbsVo/c40Zt5LE7vzU/2lLqCl/vZU0l/9
         /cesXIOHeiJoFtf/274rtmwiB/IzuSTDCyJv29V3X+06TZYEEAxhTDoRp8G2ehAFlzp1
         Z1Xeax8KaJvN2qLfPYecz7+JRC2ebABHSB77Y5GtzdS05nAGlcPXSQX878hKHIfd22rx
         /R/NxyICgBL9mNAocSAgwSB5nkcTxVYEoRFzZVsdKiv0vYAy6JYdPVsEFPc1AZdb/Z3O
         oi9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788927231; x=1789532031; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbbgDs8vchj2lrFK5eDi1gvI0D0IoQpaWTY+VveU7Sg=;
        b=gCfbydusFCJAuKAXGybVvimEY+48UpjIgVtDmsJrqNKZwloZTzxZh5hcSfC5GfRpdN
         f2bvJQIXcIVTiOz/L7BwYIcJEXHzdeUN/gTUVgYr15jsme3vZ/390+3bLKUoRw+pJYaJ
         eKWPuP9APDVzPLlE9r+IFsZk61m+sQD8T9pHUL/zsdadcc4PUWWGNYYOoWeOm8IsxSat
         I4ENd0M6W4/2TzaWKP4jqoTTPI8Yuyjm8/tSbZFMYXQvTqwBrZASLv+idZ11LF4JDXtX
         iCxfu0zC2AwlevIbzi+J+IsC2Qmu09eo3SfG3aC6AgJ2lyKQPfymEO4IE/4P/pusdVjV
         ZQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788927231; x=1789532031;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbbgDs8vchj2lrFK5eDi1gvI0D0IoQpaWTY+VveU7Sg=;
        b=IkgvPe50YqpD9ceaY+M/JOhM3jGANYZ7+kNnLkme63zgu8QCjWx3jdkuE1WYYWClyG
         nOgOlpfJoCLCU/Fu9oag3U3pw/qJlGRVq7c/djqUrod9tErirF3zzUkNR5uE6GwmzYMj
         6g9MxzQLEhpT/lTXSr02MhZ+KZ4lGR3uwe5TuNehg1Go7OmIuLEwpTIt9W7h6D6pxbb5
         UtgQh0YmKObNMTEWTCB5LYFxRY5KvJjTq3GDBp9cPsP/a2h79wzGLWQxpn5wCrOftpoG
         /kn7fScBYhKi3WCZXVJqs3u3nqWkPtB1ZhrHp6fAh4LegURKVzjFhl/VM0XHzHLL5wQe
         TVvQ==
X-Gm-Message-State: AFuF++kkzYcltjOTYwV+/Z62A3Uj/AG5X9wq553ipl/64omz45sTTRT7
	hJEf2WFSBICqlCLi5abxRl4S/nWg05CB921dVk4LF1VThlgSGk6Tha5rC1zf+M6puCEIR3cnlOQ
	K5d6pPr2X5sVEuHqYbUHlaB2LBAA0mnhFbYdq
X-Gm-Gg: AYBFou2mLfS4fMZqay1HhFFFspQ2BhoDXCt/L9MbnmlGLVhQ+Fs9+4HIJeBtki2TeAe
	WZis+6xx+riYvq/B72JJQlPrT+qE8A0JnafYUZbyH9n55HrloxttKgpL0F8NauseO9GNQhbpebF
	O9zdW1Xbb9eqjYcMcVuwjI85haEEHjBeDCgV0avMvgk4XkE3qyMGa4Hh3GXFs1kZTS8SgMOBS8L
	H2w1F9dA1ccJkn0HnJGylTKYq87Y6qaprfZ0Hm7GHrqVW26MNTQqcxXHc53jhYN5u0wau//+JFI
	TUqsx/TEnQvJ+/YyyzV2PldeAUln+HgHx4RZ52AZYTkWXdjxf2tuVcqL/68Cx47cyZP+IG8LCsO
	fcxMjyWNfI0xukW1aqUwQHSkGXcGNaXZSM39SZTrf7AHP2wRgCyDJxPDX5QqNTBPWJNY=
X-Received: by 2002:a17:903:26cc:b0:2db:56da:6a0b with SMTP id
 d9443c01a7336-2db8dc82083mr45104355ad.13.1788927230886; Tue, 08 Sep 2026
 21:13:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907034502.12619-1-phucduc.bui@gmail.com> <20260908034531.CE7F71F00A3D@smtp.kernel.org>
In-Reply-To: <20260908034531.CE7F71F00A3D@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 9 Sep 2026 11:13:38 +0700
X-Gm-Features: AcwNN1XH4hJEZ2rTmXzpWJyneeiZmqrcyvq1QfRWHmkaHeVbO6yDhYnSn862a4U
Message-ID: <CAABR9nGL0M_Uo=NZf-dCBg5czze-7LGo1a=AA67GbdF6F9-JgQ@mail.gmail.com>
Subject: Re: [PATCH net v4] net: fec: Propagate PTP initialization errors
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> Pre-existing issues:
> - [High] Use-After-Free when an interrupt fires during probe error cleanup.
> --

This issue is addressed here:

https://lore.kernel.org/all/20260909-fec-ptp-pps-event-uaf-v3-0-bead12c29a16@cherr.cc/
