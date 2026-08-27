Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3323CEBB8
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847707; cv=none; b=rY8LOalQ58Ht490y4c/WBi2iZNJaQVgRFc9ENyC46vMj3NtxkrAN73LHCJt4DHxovP847H/eserYxNzpin2vOS5x1k0EDC5XdlZ1TIqDW1i+/rzeMR3R+pQCObiwYU/qaxmeRIyDZgsSy5RkwpKYBN9AKsIWUG73FxeWXx6O3jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847707; c=relaxed/simple;
	bh=O80S3pjkeXSWObOAxYWMssL152HBOgoLeVg1gUU1MFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ll7A3H95gw9crqfxoo7Y8HXCWSoVN41sB8XjcB9LNtvHKWhWsvNStKbDRzu82BhF5QGOcCB4g2bmLubIdee80FSG5njniUQ4bxZ/Ho1tHS1jifBi36/f+GYiD3ke0xKLmRSdYq8xDynMIqSnxDkswX2Czz2Re/GimacbQFtVx3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FnjEw0dt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FnjEw0dt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so22131585e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787847704; x=1788452504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xgZRRPFD/4tuccx91/eOfBZb+vhsoVmREaFx21ykfHI=;
        b=FnjEw0dt2jChG+qnBZGS0CWu+6UQ8d2S/yJWlOpMjKkZbGk8UUZJ8nH5bMWoGz0KhS
         sQ1OOhg0s103X0wiUr2wqbZ9NAL3JvrwKZRowlgurJnAv7IZp7mkY11C7qzjK/UC4KVU
         64zSY+TSvpgULsDIzNA1CmvFY830IVQmbbtf/ap81CjJamx7pt5ZTM3fiLIUyCcmKfrv
         vHzB/nHoB1k68qcMeS7jQ7sLmasyEq9JX2b47WOgP6scqIzUIBVFmm1obKdF7bU6QYRP
         3PLRB8RL+UUurSmPqzMBhnzQ/UvdiDu32+srmAhk8cmgcNTUbacBkOvdiB+g4k73wOCW
         +Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847704; x=1788452504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgZRRPFD/4tuccx91/eOfBZb+vhsoVmREaFx21ykfHI=;
        b=Wg+6nC2Lfo5cxoeMYfo9YLa1ToVGsAz+erk5Bum5pBiFfZxf7WkL+Ixk5CcUOcjZgo
         DFiXbvZurhrs/KEQEoFdkAZ+g3WET6nGM3iCg/Mvpgc8d9yWHJOEV0EwSpOrKkVceaVp
         ecARHM55dhxwtWpnN9jj2hVUp3CS9OYO2/LEB5ljD5YMEH48TCp5uSHwjikh+IiT2xYy
         aberwrRISBhtTt23Rv2aN2qDbAqSPAG1C87gsaMMl0RrrQtvyrt8ahtxVOi80HN1ogPW
         uCNYllOgrHPViEuY9FMz2hCYZq2LwXDwDWkNoJlTjRGl7c3OLNMp+AWeWFtFgsnAWW1q
         xiyg==
X-Forwarded-Encrypted: i=1; AHgh+Rraw8shO5MkZ5ftuNVpLT+keVYIqnJ77AzXl1aI9DEreWlN6ETglDd7fRkrIN/RmcpecB7prkU+nKWsW9TwfMU=@lists.linux.dev
X-Gm-Message-State: AFuF++mkdZsAG7jELaYMek4YhS86SD2HQHqF9L5qD8hijz6zXAjLDdth
	APDcNbubRnUomfKksOGvCuFQEcNI0i3DnDaCW5uy1oODXAFoSNZ7sOdt1EpIpEeD8A==
X-Gm-Gg: AR+sD10vyXpPTWERfdg6EpH9XsXNdKkPsfGGvarHs9IVh8fIeYZ2yswO7RqEPDy9hi7
	PvXfPliz/UuRLLjAAjJDxLSxhi+3wmyuA4EI7reALrArooTNJ2kJEk9DH3CkxYTM53+DY0hkM/Q
	4UVtll2AGXry5DT9mfVNVaFs26A1FnHy6cPMf6luGh96zBmHAGIrwgz5r/Blt5fC5SApnrZRN2h
	yBLklVLIviu2uZHmRxC1AVEiMXiUv8ZrTlomftI76uYGN/Pc0bCJ55P8SZvoXmMPHv5MqF136bg
	Ki0ohuWmp7FcCh3rJLVE7Pmj2oIo/+p9vi8eWTdhf5VuRNreBx+tCnUkTNq9j+B9Xm844oem0nk
	/SUrOCw2VtlwI/if55Zhh7N3heOrkGEpT0LaGOFyua3yX5l06Tt1z74E3G/6L9SrCQXk+QOX3+0
	+rc5uRa1tNsSF4/eSQWxOfPc+MqNuKWN8V2MrZfW4hsAlJ99MXahLc8Bcz369zRm424WpL42RB2
	IazoK4ihGOstd8SpLiAo9tjAa0wFYiq
X-Received: by 2002:a05:600c:8885:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49b91c4884amr767005e9.10.1787847703719;
        Thu, 27 Aug 2026 09:21:43 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c52609sm108385e9.2.2026.08.27.09.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:21:42 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:21:39 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] tracing: Fix subbuf resize races with
 trace_pipe_raw readers
Message-ID: <apBhLDTEa_3yYZP5@google.com>
References: <20260826094528.3738023-1-vdonnefort@google.com>
 <20260826094528.3738023-2-vdonnefort@google.com>
 <20260826095947.4FF8B1F000E9@smtp.kernel.org>
 <20260826103736.2b55b464@gandalf.local.home>
 <ao8TQ-SvhjYgy43-@google.com>
 <20260826143123.1b3e3854@gandalf.local.home>
 <ao_Zu0ThaWThj9YZ@google.com>
 <20260827091541.5d03e33c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827091541.5d03e33c@gandalf.local.home>

On Thu, Aug 27, 2026 at 09:15:41AM -0400, Steven Rostedt wrote:
> On Thu, 27 Aug 2026 07:31:23 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > Looking at the function again, shouldn't we add !rb_is_static(cpu_buffer) as
> > well to the full page test?
> 
> Why? 
> 
> -- Steve

So that the splice can make progress when the ring-buffer is presistent or
user-mapped. Or do we say that's expected behaviour? 

-- 
Vincent
